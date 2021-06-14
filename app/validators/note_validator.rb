class NoteValidator < ActiveModel::Validator
  def validate(record)
    boolean_value = false
    record.subtitles.each do |subtitle|
      subtitle.points.each do |point|
        # Check that the note is not nil
        if point.note
          # Check whether there are any nonempty notes whose point is empty
          if point.name.blank? && !point.note.details.blank?
            boolean_value = true
          end
        end
      end
    end
    record.errors.add :notes,"–nonempty notes need to include a point" if boolean_value
  end
end
        
