module CheckListHelper
  
  def link_to_problem check_item_id, unit_id
    result = Result.find_by_check_item_id(check_item_id)
    if result
      problem = result.comment[0..50]
      problem += '...' if problem != result.comment
      link_to problem, edit_result_path(:id => result.id)
    else
      link_to "Report Problem", new_result_path(:check_item_id => check_item_id, :unit_id => unit_id)
    end   

  end
end
