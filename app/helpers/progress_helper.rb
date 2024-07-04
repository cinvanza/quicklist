module ProgressHelper
  def fivestar(review_list)
    count = 0
    review_list.each do |review|
      if review.rating == 5
        count += 1
      end
    end
    return count
  end

  def fourstar(review_list)
    count = 0
    review_list.each do |review|
      if review.rating == 4
        count += 1
      end
    end
    return count
  end

  def threestar(review_list)
    count = 0
    review_list.each do |review|
      if review.rating == 3
        count += 1
      end
    end
    return count
  end

  def twostar(review_list)
    count = 0
    review_list.each do |review|
      if review.rating == 2
        count += 1
      end
    end
    return count
  end

  def onestar(review_list)
    count = 0
    review_list.each do |review|
      if review.rating == 1
        count += 1
      end
    end
    return count
  end

  def progress(number)
    progress = (number / 5.0) * 100
    return progress
  end
end
