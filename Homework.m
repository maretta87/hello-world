%% Let's use this a a place for you to build a complete script, each 'homework' should be incorporated into the current script so you're slowly building it into what you want
% 


% HOMEWORK 1:
%Define and show white fixation circle

sca;
close all;

% DB - Remember to comment on your code, just so when you return to it you
% know what the different parts do, it also helps with debugging the script
try
    % DB - This first part is good
    PsychDefaultSetup(2);
    screens = Screen('Screens');
    screenNumber = max(screens) % Remember to include semicolons at the end of statements to supress output to the command window
    white = WhiteIndex(screenNumber);
    black = BlackIndex(screenNumber);
    grey = [0.502, 0.502, 0.502];
    [window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey);
    [screenXpixels, screenYpixels] = Screen('WindowSize', window);
    [xCenter, yCenter] = RectCenter(windowRect);
    ifi = Screen('GetFlipInterval', window);
    Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');% Enable alpha blending for anti-aliasing, NECESSARY FOR THE 'DRAWDOT' FUNCTION
    
    windowRect = Screen(0, 'Rect');
    % DB - Why have you included this? You have already set windowRect in
    % line 21 above, and you don't use it after this line.
    
    stimulusRect = [0 0 500 500]; % this is an area smaller than the full screen in which to present stimuli
    % DB - Okay
    
    dotColor = [white]; % Set the color
    
    dotXpos =  960 * screenXpixels; % values obtained with the script below
    dotYpos =  540 * screenXpixels; % value obrained with the  script below
    % DB - You've got the idea here, but not implimented it correctly. Take
    % a look at the values produced for dotXpos & dotYpos and think about
    % where they are on a screen
    
    dotSizePix = 20; % in e prime it was 3% width  and  9% height,
    % DB - A good start, but currently it is a fixed value. So now try and
    % make it so that it automatically scales to the size of the screen
    
    Screen('DrawDots', window, [dotXpos dotYpos], dotSizePix, dotColor, [], 2);
    Screen('Flip', window);   
    KbStrokeWait;
    % DB - Good (although see above about coordinates), but currently it
    % doesn't do anything after you press the key.
    % Next step is to get it to close the screen when the key is pressed
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
    
    % DB - So this first line is all you need to get the X and Y
    % coordinates of the centre of the screen
    [xCenter, yCenter] = RectCenter(windowRect);
    
    windowRect = Screen(0, 'Rect');
    
    [X,Y] = RectCenter('Rect');
    [w, rect] = Screen('OpenWindow',0);
catch
    xcenter = rect(3)/2;
    ycenter = rect(4)/2;
    
end


% Homework 3:

% Update this script so it will do the following when I run it:
% - Open a window with a grey background (You've already done this)
% - Draw a white fixation dot in the centre of the screen that is 3% of the
% screen width and 9% of the screen height (You've almost done this, but
% not quite)
% - Have it close the screen after I have pressed a button on the keyboard
% (You're halfway there with the KbStrokeWait function)