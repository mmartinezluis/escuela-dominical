
class PointSubtitleValidator < ActiveModel::Validator
  def validate(record)
    boolean_value = false
    record.subtitles.each do |subtitle|
      subtitle.points.each do |point|
        # Check whether there is a nonempty point with a blank subtitle
        if !point.name.blank? && point.subtitle.name.blank?
          boolean_value = true 
        end
      end  
    end
    record.errors.add :points, "–nonempty points need to include a subtitle" if boolean_value
  end
end