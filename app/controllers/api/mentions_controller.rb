class Api::MentionsController < ApplicationController
  def users
    @users = query(User, 'username')
    render_for_api :mention, json: @users, root: :mentionables
  end

  def recordings
    @recordings = query(Recording, ['name', 'slug'])
    render_for_api :mention, json: @recordings, root: :mentionables
  end

  private

  def query(klass, fields)
    query = params[:query]
    fields = Array(fields)
    sql_fields = Array(fields).map { |f| "#{f} LIKE :query" }.join(' OR ')

    if query.blank?
      klass.limit(10)
    else
      klass.where(sql_fields, query: "#{query}%")
        .limit(10)
    end
  end
end