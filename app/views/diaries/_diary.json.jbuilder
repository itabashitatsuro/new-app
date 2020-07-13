json.extract! diary, :id, :content, :date, :image, :created_at, :updated_at
json.url diary_url(diary, format: :json)
