Steps to run the script:

STEP 1: Install Python and add python path to environment variables

STEP 2: Download or Clone the repo

STEP 3: Open command prompt as admin user

STEP 4: Change Directory to project folder

STEP 5: Run command pip install -r requirements.txt

STEP 6: Installation Should be successful

STEP 7: Run below command:

robot -d results\test -v BROWSER:chrome -v USERNAME:linkedinUsername -v PWD:LinkedinPassword --pythonpath resources tests\

Note in STEP# 7:

      USERNAME is your LinkedIn User Name
      
      PWD is your LinkedIn Password
      
      For headless replace chrome with headlesschrome
