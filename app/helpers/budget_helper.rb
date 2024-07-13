module BudgetHelper
  def compare_budget(product_list)
    product_list.pluck(:price).compact.sum
  end

  # METHOD THAT RECEIVES A LIST OF PRODUCTS AND ADDS ITS PRICES THAT ARE CONVERTED TO BIGDECIMALS AND NILS TO ZEROS
  def list_price_sum(products)
    total = products.sum do |product|
      if product.quantity.present?
        product_quantity = product.quantity
        product_price = product.price
      else
        product_quantity = 0
        product_price = 0
      end
      product_quantity * product_price
    end
    puts total
    return total
  end

  # METHOD THAT RECEIVES THE BUDGET OF A LIST AND THE SUM OF ALL THE PRICES OF ITS PRODUCTS AND RETURNS THE DIFFERENCE
  def left_to_spend(total_budget, price_sum)
    left = total_budget - price_sum
    return left
  end

  # METHOD THAT RECEIVES THE TOTAL SPENT, THE BUDGET AND RETURNS THE SPENT PERCENTAGE
  def spent_percentage(spent, total_budget)
    spent_percentage = (spent / total_budget) * 100
    puts "SPENT PERCENTAGE"
    puts spent_percentage
    return spent_percentage
  end

  # METHOD THAT RECEIVES THE REMAINING BUDGET, TOTAL BUDGET, AND RETURNS WHATS LEFT OF BUDGET IN PERCENTAGE
  def remaining_budget_percentage(left, total_budget)
    puts "REMAINING BUDGET TO SPEND PERCENTAGE"
    remaining_percentage = (left / total_budget) * 100
    puts remaining_percentage
    return remaining_percentage
  end

  # METHOD THAT RETURNS TRUE IF THE SPENT VALUE SURPASSES THE TOTAL AVAILABLE BUDGET
  def surpass_budget(spent, total_budget)
    check = false
    if spent > total_budget
      check = true
    end
    return check
  end

end
