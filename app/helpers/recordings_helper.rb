module RecordingsHelper
  def metadata_for(recording)
    user = recording.author
    color = recording.sti_style[:color]

    tag.div [
      tag.span(recording.term.capitalize, class: "text-white p-1 rounded mr-1 text-sm font-semibold bg-#{color}"),
      tag.span('by ', class: 'text-gray-600'),
      link_to(user.username, user_path(user.username), class: 'text-gray-700'),
      rp('tags/list', tags: recording.tags),
    ].join.html_safe
  end

  def each_recording_type_with_style
    Recording::Types::LIST.each do |type|
      yield(type, Recording.sti_style_of(type))
    end
  end
end