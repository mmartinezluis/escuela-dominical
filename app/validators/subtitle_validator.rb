class SubtitleValidator < ActiveModel::Validator
  def validate(record)
    if record.subtitles[0..1].any? { |s| s.name.blank? }
      record.errors.add :subtitles, "–a study requires at least 2 subtitles"
    end  
  end
end