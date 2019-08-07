json.questions do
  json.array! @test.questions do |q|
    json.id q.id
    json.text q.text
    json.answer q.answer
  end
end