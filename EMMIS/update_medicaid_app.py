# update_medicaid_app.py
import sys

ear_file = sys.argv[0]
app_name = 'medicaid'

print("Updating application:", app_name)
AdminApp.update(app_name, 'app', ['-operation', 'update', '-contents', ear_file])
AdminConfig.save()
print("Application updated and configuration saved.")
