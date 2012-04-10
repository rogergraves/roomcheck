module ApplicationHelper
  
  def define_severity(severity)
    case severity
      when 0 then "OK"
      when 1 then "Negligable"
      when 2 then "Minor"
      when 3 then "Moderate"
      when 4 then "Serious"
      when 5 then "Emergency!!"
    end
  end

  
end
