module BudgetHelper
  def compare_budget(product_list)
    product_list.pluck(:price).compact.sum
  end

  # METHOD THAT RECEIVES A LIST OF PRODUCTS AND ADDS ITS PRICES THAT ARE CONVERTED TO BIGDECIMALS AND NILS TO ZEROS
  def list_price_sum(products)
    return products.sum { |product| BigDecimal(product[:price] || 0) }
  end

  # METHOD THAT RECEIVES THE BUDGET OF A LIST AND THE SUM OF ALL THE PRICES OF ITS PRODUCTS AND RETURNS THE DIFFERENCE
  def left_to_spend(total_budget, price_sum)
    left = total_budget - price_sum
    return left
  end

  def spent_percentage(spent, total_budget)
    spent_percentage = (spent / total_budget) * 100
    puts "SPENT PERCENTAGE"
    puts spent_percentage
    return spent_percentage
  end

  def remaining_budget_percentage(left, total_budget)
    puts "REMAINING BUDGET TO SPEND PERCENTAGE"
    remaining_percentage = (left / total_budget) * 100
    puts remaining_percentage
    return remaining_percentage
  end
end
