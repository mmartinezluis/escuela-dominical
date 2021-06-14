class PointValidator < ActiveModel::Validator
  def validate(record)
    if record.subtitles.first.points.first.name.blank?
      record.errors.add :points, "–the first point for the first subtitle cannot be blank"
    end  
  end
end