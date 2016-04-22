# hello-world
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
   
 
    
    % HOMEWORK 1: 
    %Define and show white fixation circle 
    
    sca;
    close all;
   
    
    try 
    PsychDefaultSetup(2);
    screens = Screen('Screens');
    screenNumber = max(screens)
    white = WhiteIndex(screenNumber);
    black = BlackIndex(screenNumber);
    grey = [0.502, 0.502, 0.502];
    [window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey);
    [screenXpixels, screenYpixels] = Screen('WindowSize', window);
    [xCenter, yCenter] = RectCenter(windowRect);
    ifi = Screen('GetFlipInterval', window);
    Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');% Enable alpha blending for anti-aliasing, NECESSARY FOR THE 'DRAWDOT' FUNCTION 
    windowRect = Screen(0, 'Rect');
    stimulusRect = [0 0 500 500]; % this is an area smaller than the full screen in which to present stimuli
    dotColor = [white]; % Set the color 
    dotXpos =  960 * screenXpixels; % values obtained with the script below 
    dotYpos =  540 * screenXpixels; % value obrained with the  script below 
    dotSizePix = 20; % in e prime it was 3% width  and  9% height, 
    Screen('DrawDots', window, [dotXpos dotYpos], dotSizePix, dotColor, [], 2);
    Screen('Flip', window);
    KbStrokeWait;
    catch 
    end 
    
    
    
    % HOMEWORK 2: 
    
    % script to get the coordinates of the center of the screen since which
    % I have inserted before in order to set the position of the fixation
    % point...not sure if it is right though!
  
    try
        
        PsychDefaultSetup(2); % Here we call some default settings for setting up Psychtoolbox
        screens = Screen('Screens'); % Get the screen numbers
        screenNumber = max(screens); % Draw to the external screen if avaliable
        [window, windowRect] = PsychImaging('OpenWindow', screenNumber, black); % Open an on screen window
        [screenXpixels, screenYpixels] = Screen('WindowSize', window);
        [xCenter, yCenter] = RectCenter(windowRect);
        windowRect = Screen(0, 'Rect');
        
        [X,Y] = RectCenter('Rect');  
        [w, rect] = Screen('OpenWindow',0);
    catch
        xcenter = rect(3)/2;
        ycenter = rect(4)/2;
        
    end
    
    
    
    
 
    
    
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
