# hello-world
sca;
close all;
% I am sorry, Dan, this programme is as useful as confusing! I haven't really understood how to make changes to the existing files, so I am afraid 
% we will have to work on new files everytime until next time we meet! -.-
% here some changes and I hope I have done the homework 3, again I couldn't display..don't understand why!


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
    
%   % I thought it would have been useful to refer to it with a more brief name 'Rect', that's all, but I will delete it then ;)
%   % windowRect = Screen(0, 'Rect');
%     % DB - Why have you included this? You have already set windowRect in
%     % line 21 above, and you don't use it after this line.
    
    baseRect = [0 0 200 200]; % this is an area smaller than the full screen in which to present stimuli
    % DB - Okay
    
    dotColor = [white]; % Set the color
    
    dotXpos =  screenXpixels * 0.5; % values obtained with the script below
    dotYpos = yCenter; % value obrained with the  script below
    % DB - You've got the idea here, but not implimented it correctly. Take
    % a look at the values produced for dotXpos & dotYpos and think about
    % where they are on a screen
    %
    
    dotSizePix = [0 0 0.3 0.9]; % in e prime it was 3% width  and  9% height,
    % DB - A good start, but currently it is a fixed value. So now try and
    % make it so that it automatically scales to the size of the screen
    
    Screen('DrawDots', windowRect, [dotXpos dotYpos], dotSizePix, dotColor, [], 2);
    Screen('Flip', windowRect);   
    while ~KbCheck;% display the fixation dot until a key is pressed
    % DB - Good (although see above about coordinates), but currently it
    % doesn't do anything after you press the key.
    % Next step is to get it to close the screen when the key is pressed
catch
    
end
