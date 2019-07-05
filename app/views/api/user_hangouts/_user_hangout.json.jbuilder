json.id user_hangout.id
json.user_id user_hangout.user_id
json.hangout do
  json.partial! user_hangout.hangout, partial: "api/hangouts/hangout", as: :hangout
end