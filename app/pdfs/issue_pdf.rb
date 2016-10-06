class IssuePdf < Prawn::Document
  def initialize(issue)
    super()
    @issue = issue













    table([ ["short", "short", "loooooooooooooooooooong"],
            ["short", "loooooooooooooooooooong", "short"],
            ["loooooooooooooooooooong", "short", "short"] ])



    float do

      bounding_box([0, cursor], :width => 550) do
        text "MLDL II - Mitigating Local Disputes in Liberia, Phase II"

        line [0, cursor], [550, cursor]
        stroke
        move_down 5
        text "Issue: #{@issue.issuecode}"
        text "#{@issue.name}"
        @history = Issueaction.where('issue_id =?', @issue.id)


        bounding_box([0, cursor], :width => 550) do





          @history.each do |action|





            bounding_box([0, cursor], :width => 550) do

            text "Action: #{action.created_at}"

            text "Action: #{action.actiontype_humanize}"

            text "Action: #{action.user.name}"



          end
        end

        end



    end




    end






  end










end