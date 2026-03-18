% This script helps you create the Lab04.mlapp file.
%
% HOW TO USE:
% 1. Open MATLAB
% 2. Navigate to the folder containing Lab04.m and this script
% 3. Run this script by typing: create_mlapp
% 4. The Lab04.mlapp file will be created in the same folder
%
% ALTERNATIVE (Manual method):
% 1. Open MATLAB App Designer (type 'appdesigner' in Command Window)
% 2. Create a new app
% 3. Switch to "Code View"
% 4. Copy the entire content of Lab04.m and paste it
% 5. Save as Lab04.mlapp

% Get the directory of this script
scriptDir = fileparts(mfilename('fullpath'));

% Source and destination paths
sourceFile = fullfile(scriptDir, 'Lab04.m');
destFile = fullfile(scriptDir, 'Lab04.mlapp');

% Check if source file exists
if ~isfile(sourceFile)
    error('Lab04.m not found in the current directory.');
end

% Copy .m to .mlapp (MATLAB treats them the same internally)
copyfile(sourceFile, destFile);

fprintf('Lab04.mlapp has been created successfully!\n');
fprintf('You can now open it with: open Lab04.mlapp\n');
fprintf('Or submit it to Moodle.\n');
