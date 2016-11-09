module PassengersHelper
  def category_name(passenger)
    if passenger.adult?
      return "Adult"
    elsif passenger.child?
      return "Child"
    elsif passenger.infant?
      return "Infant"
    else
      return ""
    end
  end

  def title_options(is_adult)
    if is_adult
      return "<option value='male'>MR</option><option value='female'>MS</option>".html_safe
    else
      return "<option value='male'>MSTR</option><option value='female'>MISS</option>".html_safe
    end
  end

  def title_name(passenger)
    if passenger.adult?
      if passenger.gender?
        return "MR"
      else
        return "MS"
      end
    else
      if passenger.gender?
        return "MSTR"
      else
        return "MISS"
      end
    end
  end

  def title_name_by_str(gender_str)
    if gender_str == "male"
      return "MR"
    else
      return "MS"
    end
  end
end
