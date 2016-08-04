class StaffGuide < Prawn::Document

  def initialize(sections)
    super(top_margin: 70)
    @sections = sections




    text "Order Goes Here"
    @sections.each do |section|

      if section.level_id == 1
        text "#{section.name}", size: 20, style: :bold
      elsif section.level_id == 2
        text "#{section.name}", size: 15, style: :bold
      elsif section.level_id == 3
            text "#{section.name}", size: 10, style: :bold
      else
        text "#{section.name}"
      end

      jimmy= makeraw(section.body)

      move_down 5
      text "#{jimmy}"






      move_down 20

    end



  end
  def makeraw(dump)
      raw1=dump.html_safe
      return raw1
  end
  def header1

  end

end