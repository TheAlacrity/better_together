json.id message.id
json.name message.sender.first_name
json.body message.body
json.sender_id message.sender_id
# json.recipient_id message.recipient_id
json.created_at message.created_at.strftime("%b %e, %l:%M %p")
