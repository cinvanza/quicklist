module BudgetHelper

  def compare_budget(product_list)
    product_list.pluck(:price).compact.sum
  end
end
