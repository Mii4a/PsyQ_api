json.extract! workbook, :id, :subject_name, :subject_explanation, :subject_image, :created_at, :updated_at
json.url workbook_url(workbook, format: :json)
