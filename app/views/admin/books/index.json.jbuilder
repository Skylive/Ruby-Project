json.array!(@books) do |book|
  json.extract! book, :id, :title, :isbn, :description, :author, :image, :member_id, :end_date, :max_end_date, :last_member_id, :last_loan_date, :isactivebook, :reason
  json.url book_url(book, format: :json)
end
