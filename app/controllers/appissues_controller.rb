class AppissuesController < ApplicationController
  before_action :set_appissue, only: [:show, :edit, :update, :destroy]

  # GET /appissues
  # GET /appissues.json
  def index
      Appissue.where('issue_id in (?)', [501,363,176,177]).destroy_all
      @uniquemeetings = Appissue.select(:meetingname, :structure, :structurecounty, :structuredistrict, :meetingcode, :originalmeetingdate).order(:meetingcode).uniq

      @uniquemeetings.each do |meet|

       if !meet.originalmeetingdate.blank? and !meet.structurecounty.blank? and !meet.structuredistrict.blank? and !meet.structure.blank? and !meet.meetingcode.blank?
          s = self.newstructureid(meet.structurecounty, meet.structuredistrict, meet.structure)
          if s == 0 or s.nil?
            s = 1
          end
          m=Meeting.create(name: meet.meetingname, real_start: meet.originalmeetingdate, old_id: meet.meetingcode, structure_id: s)
        end

      end

       newissues = Appissue.order(:id)
       #yourname column would be users in CSV so Ill leave that alone fon now
       newissues.each do |issue|
         s = self.newstructureid(issue.structurecounty, issue.structuredistrict, issue.structure)
         cat = self.retcategory(issue.category)
         d = self.retdist(issue.issuedistrict)
         scpe = self.retscope(issue.status)
         if !issue.resolutiontype.blank?
         rt = self.retrestype(issue.resolutiontype)
         else
           rt = 0
         end
         if s == 0 or s.nil? or s.blank?
           thisstructureid = 1
         else
           thisstructureid = s


         end

         if issue.report_ongoing == 'Resolved' or issue.status == 'Resolved' or issue.mediationoutcome == 'Resolved' or issue.updatetype == 'Resolution'
           if issue.resolutiondate.nil?
             rd= issue.originalmeetingdate
           else
             rd = issue.resolutiondate
           end
           vstatus = 3   #status is resolved
         else
           vstatus = 2   #status is ongoing

         end

         if cat == 0
           cat = nil
         end


         mldlissue = Issue.create(
             old_id: issue.issueid,
             structure_id: thisstructureid,
             scope_id: scpe,
             district_id: d,
             community: issue.community,
             category_id: cat,
             description: issue.issuedescription,
             name: issue.issuename,
             originaltimestamp:issue.originaltimestamp,
             originaluser: issue.yourname,
             uuid: issue.uuid,
             actioncommittee: issue.actionplancommittee,
             actionplan: issue.actionplandescription,
             resolutiontype_id: rt,
             status: vstatus,

             resolution_date: rd)




         thismeeting = Meeting.where('old_id = ?', issue.meetingcode).first

         # creates an Agenda action for each issues link to a meeting
         if thismeeting.nil?
           meetid=0
         else
           meetid=thismeeting.id
         end
         if !issue.originalmeetingdate.nil?
           agenda = Issueaction.create(issue_id: mldlissue.id, actiontype: 2, user_id: 1, meeting_id: meetid)
           agenda.created_at = issue.originalmeetingdate
           agenda.save
         end



         if !issue.mediationdate.nil?
           addmed = Mediation.create(issue_id: mldlissue.id, mediation_start: issue.mediationdate)
           medaction=Issueaction.create(issue_id: mldlissue.id, actiontype: 7, user_id: 1, mediation_id: addmed.id)

           medaction.created_at = issue.mediationdate

           medaction.save
         end

         if !issue.statusnotes.blank?
           statusnote = Issueaction.create(issue_id: mldlissue.id,actiontype: 3, actionbody: issue.statusnotes, user_id: 1)

           if !issue.originalmeetingdate.nil?
             statusnote.created_at = issue.originalmeetingdate
           else
             statusnote.created_at = issue.originaltimestamp
           end

           #statusnote.save
         end

         if !issue.actionplannotes.blank?
           actplan = Issueaction.create(issue_id: mldlissue.id, actiontype: 3, actionbody: issue.actionplannotes, user_id: 1)
           if !issue.originalmeetingdate.nil?
             actplan.created_at = issue.originalmeetingdate
           else
             actplan.created_at = issue.originaltimestamp
           end

           #actplan.save
         end




         if !issue.updatedescription.blank? and !issue.updatetype.nil?

           if issue.updatetype.include? 'Resolution'
             acttype=5
           elsif issue.updatetype.include? 'Referred'
             acttype=6

           elsif issue.updatetype.include? 'Mediation'
             acttype=7
           else
             acttype=3
           end

           updater = Issueaction.create(issue_id: mldlissue.id, actiontype: acttype, actionbody: issue.updatedescription, user_id: 1)
           if !issue.updatedate.nil?
             updater.created_at = issue.updatedate
           else
             updater.created_at = issue.originaltimestamp
           end
           #updater.save
         end











       end




  end



  def newstructureid(county, district, structure)
    if structure == 'NSC'
      s=1
    else
        if county == 'Nimba'
          if structure == 'CSC'
          s=14
          elsif district
            if district.include? 'Gbehlay'
              if structure == 'DSC'
              s=15
              elsif structure == 'CF'
              s=16
              else
              s=14
              end
            elsif district.include? 'Buu'
              if structure == 'DSC'
              s=17
              elsif structure == 'CF'
              s=18
              else
              s=14
              end
            elsif district.include? 'Wee'
              if structure == 'DSC'
              s=19
              elsif structure == 'CF'
              s=20
              else
              s=14
              end
            elsif district.include? 'Kpai'
              if structure == 'DSC'
              s=21
              elsif structure == 'CF'
              s=22
              else
              s=14
              end
            elsif district.include? 'Garr-B'
              if structure == 'DSC'
              s=23
              elsif structure == 'CF'
              s=24
              else
              s=14 #default to CSC
              end
            elsif district.include? 'Yarm'
              if structure == 'DSC'
              s=25
              elsif structure == 'CF'
              s=26
              else
              s=14
              end
            else
              s=14
           end
          end




        elsif county == 'Bong'
          if structure == 'CSC'
            s=2
          elsif district
            if district.include? 'Kpaai'
              if structure == 'DSC'
              s=3
              elsif structure == 'CF'
              s=4
              else
              s=2
              end
            elsif district.include? 'Suak'
              if structure == 'DSC'
              s=5
              elsif structure == 'CF'
              s=6
              else
              s=2
              end
          end
          else
            s=2

          end



        elsif county == 'Lofa'
          if structure == 'CSC'
            s=7
          elsif district
            if district.include? 'Foya'
              if structure == 'DSC'
              s=8
              elsif structure == 'CF'
              s=9
              else
              s=7
              end
            elsif district.include? 'Voin'
              if structure == 'DSC'
              s=10
              elsif structure == 'CF'
              s=11
              else
              s=7
              end
            elsif district.include? 'Zor'
              if structure == 'DSC'
              s=12
              elsif structure == 'CF'
              s=13
              else
              s=7
              end
            end
          else
            s=7
          end

        elsif county == 'Grand Gedeh'
          if structure == 'CSC'
           s=27
          elsif district
            if district.include? 'Bhai'
              if structure == 'DSC'
              s=28
              else
              s=27
              end
            elsif district.include? 'Gbao'
              if structure == 'DSC'
              s=28
              else
              s=27
              end
            elsif district.include? 'Kono'
              if structure == 'DSC'
              s=28
              else
              s=27
              end
            end
          else
            s=27

          end
        else
          s=1
        end
    end

    return s
end



  def retcategory(category)
    if !category.nil?
      if category.include? 'Land'
        c = 1
      elsif category.include? 'International'
        c= 2
      elsif category.include? 'Internal'
        c= 3
      elsif category.include? 'Violence'
        c= 4
      elsif category.include? 'Corruption'
        c= 5
      elsif category.include? 'Infrastructure'
        c= 6
      elsif category.include? 'Security'
        c= 7
      elsif category.include? 'Health'
        c= 8
      elsif category.include? 'Tradition'
        c= 9
      elsif category.include? 'Other'
        c= 10
      end
    else
      c=0
    end

    return c
  end



  def retdist(district)
     if !district.nil?
      if district.include? 'Voinjama'
        d=16
      elsif district.include? 'Buu-Yao'
        d=19
      elsif district.include? 'Quardu Boundi'
        d=0
      elsif district.include? 'Gbehlay-Geh'
        d=18
      elsif district.include? 'Gbao'
        d=30
      elsif district.include? 'Tchien'
        d=0
      elsif district.include? 'Kparblee'
      d=21
      elsif district.include? 'Kpaai'
      d=7
      elsif district.include? 'Zorzor'
      d=17
      elsif district.include? 'Yarpea Mahn'
      d=0
      elsif district.include? 'Foya'
      d=12
      elsif district.include? 'Leewehpea-Mahn'
      d=0
      elsif district.include? 'Suakoko'
      d=8
      elsif district.include? 'Kolahun'
      d=13
      elsif district.include? 'Konobo'
      d=31
      elsif district.include? 'hai'
      d=29
      elsif district.include? 'Garr-Bain'
      d=22
      elsif district.include? 'Wee-Gbehyi-Mahn'
      d=20
      elsif district.include? 'Sanniquellie Mahn'
      d=25
      elsif district.include? 'Fuamah'
      d=5
      elsif district.include? 'Yarmein'
      d=23
      else
        d=0
      end
     else
       d=0
     end

      return d
  end



  def retscope(status)
      if !status.nil?
        if status.include? 'Short-term'
          sc = 1
        elsif status.include? 'Long-term'
          sc= 2
        elsif status.include? 'Ongoing Violence'
          sc= 3
        elsif status.include? 'Threat'
          c= 4
        elsif status.include? 'Security'
          sc= 5
        else
         sc= 0
        end
      else
        sc=0
      end

    return c
  end


  def retrestype(rtype)
    if !rtype.nil?
      if rtype.include? 'Structure'
        rt = 1
      elsif rtype.include? 'community'
        rt= 2
      elsif rtype.include? 'MLDL'
        rt= 3
      elsif rtype.include? 'Other'
        rt = 4
      else
        rt= 0
      end
    else
      rt=0
    end

    return rt
  end







  def uploadcsv
    Appissue.import(params[:file])
    redirect_to root_url, notice: "Google Apps Issues imported."


  end

  def makemeetings
    @meetings = Appissue.select(:originalmeet, :meetingname, :structurecode, :county, :district).order(:meetingname).uniq
    @countydist = Appissue.select(:county, :district).order(:county, :district).uniq

  end





  # GET /appissues/1
  # GET /appissues/1.json
  def show
  end

  # GET /appissues/new
  def new
    @appissue = Appissue.new
  end

  # GET /appissues/1/edit
  def edit
  end

  # POST /appissues
  # POST /appissues.json
  def create
    @appissue = Appissue.new(appissue_params)

    respond_to do |format|
      if @appissue.save
        format.html { redirect_to @appissue, notice: 'Appissue was successfully created.' }
        format.json { render :show, status: :created, location: @appissue }
      else
        format.html { render :new }
        format.json { render json: @appissue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appissues/1
  # PATCH/PUT /appissues/1.json
  def update
    respond_to do |format|
      if @appissue.update(appissue_params)
        format.html { redirect_to @appissue, notice: 'Appissue was successfully updated.' }
        format.json { render :show, status: :ok, location: @appissue }
      else
        format.html { render :edit }
        format.json { render json: @appissue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appissues/1
  # DELETE /appissues/1.json
  def destroy
    @appissue.destroy
    respond_to do |format|
      format.html { redirect_to appissues_url, notice: 'Appissue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appissue
      @appissue = Appissue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appissue_params
      params.require(:appissue).permit(:uuid, :yourname, :originalmeet, :issueid, :meetingname, :structurecode, :county, :district, :status, :issuedistrict, :community, :category, :raisedby, :disputant, :duration, :actioncommittee, :actiondescription, :actionnote, :resolved, :resolutiondate, :docslink, :updatetype, :resolutiontype, :updated_on, :updatedesc, :mediationdate, :mediationoutcome, :issuedesc, :issuename, :issuenote, :statusnote)
    end
end
