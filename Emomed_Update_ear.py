# update_ear.py
import sys

# EAR file path passed as first argument
earFile = sys.argv[0]

# App name passed as second argument
appName = sys.argv[1]

print("Updating application:", appName)
print("Using EAR file:", earFile)

# Perform update
AdminApp.update(appName, 'app', [
  '-operation', 'update',
  '-contents', earFile,
  '-usedefaultbindings'
])

AdminConfig.save()

print("✅ Application '{}' updated successfully.".format(appName))