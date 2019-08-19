json.tests do
  json.array! @tests do |t|
    json.id t.id
    json.name t.name
    json.count t.questions.count
    json.last_question t.questions.order(:created_at).last.text
  end
end