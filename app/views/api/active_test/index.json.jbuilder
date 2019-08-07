json.tests do
  json.array! @tests do |t|
    json.id t.id
    json.name t.name
    json.count t.questions.count
  end
end