%% 


close all; % Close all figures
clear all; % Clear all variables
sca; % Close all PTB windows

try
    % Configure screen
    PsychDefaultSetup(2); % Here we call some default settings for setting up Psychtoolbox
    screens = Screen('Screens'); % Get the screen numbers
    screenNumber = max(screens); % Draw to the external screen if avaliable
    
    % Define colours
    white = WhiteIndex(screenNumber);
    black = BlackIndex(screenNumber);
    grey = [0.502, 0.502, 0.502]; % Define other colours for screen (e.g. grey = [];)
    
    % Opening PTB window
    [window, windowRect] = PsychImaging('OpenWindow', screenNumber, black); % Open an on screen window
    [screenXpixels, screenYpixels] = Screen('WindowSize', window); % Get the size of the on screen window
    ifi = Screen('GetFlipInterval', window); % Query the frame duration
    [xCenter, yCenter] = RectCenter(windowRect);% Get the centre coordinate of the window in pixels    
    
    % Eg What percentage of the screen should the fixation be?
    % Where on screen do you want it displayed (ie 50% by 50%)
    % And other stimuli?

    % This will be useful
    StartRect = CenterRectOnPointd(OneCmRect, xCenter, yStart); % Defining a rectangle on screen by giving size and centre point

    % Loading stimuli list
    for n = 1:sheets
        [~, ~, stimList{n}] = xlsread('ListStimuli.xlsx', n);
    end
    
    % Example of text strings for display
    pref = ['Which product did you prefer?\n\n'...
        'Press 1 for image 1\n'...
        'Press 2 for image 2'];
    
    % For drawing text on screen
    DrawFormattedText(window, pref, 'center', 'center');
    
    % For drawing textures on screen
    map = imread(x); % Import image
    image = Screen('MakeTexture', window, map); % Convert to PTB
    Screen('DrawTexture', window, image) % Draw on unflipped screen
    
    initTime = Screen('Flip', window);

    RestrictKeysForKbCheck(KbName('5'));    % Only check 5 key
    
    while KeyIsDown == 0
        [KeyIsDown, RTime, keyCode] = KbCheck;
    end
    
    response = KbName(keyCode);
    RT = round((RTime - initTime) * 1000);    % Response Time in ms
    
catch
    
end
