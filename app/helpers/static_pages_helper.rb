module StaticPagesHelper
  def years_coding
    Date.today.year - Date.new(2014, 6, 1).year
  end
end
