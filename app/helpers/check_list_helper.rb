module CheckListHelper
  
  def describe_problem(check_item_id)
    result = Result.find_by_check_item_id_and_completed_on(check_item_id, nil)
    if result && result.severity > 0
       result.comment.nil? ? problem = "#{define_severity(result.severity)} problem reported" : problem = result.comment[0..50]
       problem += '...' if problem != result.comment && !result.comment.nil?
       problem += " (#{define_severity(result.severity)})"
       problem += " <i class='icon-picture'></i>".html_safe unless result.image.nil? || result.image.blank?
    
       return problem
    elsif result && result.severity == 0
      return "Marked OK #{time_ago_in_words(result.updated_at)} ago"
    else
      "Not checked"
    end   
    
  end
  
  def link_to_problem(check_item_id)
    result = Result.find_by_check_item_id_and_completed_on(check_item_id, nil)

    if result
      if result.severity > 0
        link_to("Edit Problem", edit_result_path(:id => result.id), :class => "btn btn-info", :name => "check_item_#{check_item_id}")
      else
        link_to("Report Problem", edit_result_path(:id => result.id), :class => "btn btn-success", :name => "check_item_#{check_item_id}")
      end
    else
      link_to("Report Problem", new_result_path(:check_item_id => check_item_id), :class => "btn btn-warning", :name => "check_item_#{check_item_id}")
    end
  end
      
end
