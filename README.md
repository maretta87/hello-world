# hello-world
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
    
%   % I thought it would have been useful to refer to it with a more brief name 'Rect', that's all, but I will delete it then ;)
%   % windowRect = Screen(0, 'Rect');
%     % DB - Why have you included this? You have already set windowRect in
%     % line 21 above, and you don't use it after this line.
    
    baseRect = [0 0 200 200]; % this is an area smaller than the full screen in which to present stimuli
    % DB - Okay
    
    dotColor = [white]; % Set the color
    
    dotXpos =  screenXpixels * 0.5; % in eprime the fixation was at center X position
    dotYpos = screenXpixels * 0.48; % I worte this number, because in eprime the fixation was at the 48% on y position 
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

% Homework 4 I had a go at this homework as well)
% write text lines for the instructions
close all;
clearvars;
sca


PsychDefaultSetup(2);
screens = Screen('Screens');
screenNumber = max(screens);
black = BlackIndex(screenNumber);
white = WhiteIndex(screenNumber);
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey);
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
[screenXpixels, screenYpixels] = Screen('WindowSize', window);
[xCenter, yCenter] = RectCenter(windowRect);

% lines of text
line1 = 'The task is composed by two subtasks: ';
line2 = '\n In the first, you have to judge whether the orientation degrees of two pattern is same "S" or different "D"';
line3 = '\n\n In the second, the same pattern will be shortly presented again, followed by just one of the stimuli ';
line4 = '\n\n\n which you have to judge as same "S" or different "D" compared to its corresponding';
line5 = '\n\n\n\n IMPORTANT: Keep your eyes fixating the white circle between the stimuli and you fingers on the "S" and "D" keys!'

% Draw all the text in one go
Screen('TextSize', window, 70);
DrawFormattedText(window, [line1 line2 line3 line4 line5],...
    'center', screenYpixels * 0.25, white);

DrawFormattedText(window, pref, 'center', 'center');

% Flip to the screen
Screen('Flip', window);

% check for keyboard press
        [keyIsDown,secs,keyCode] = KbCheck;
        % if spacebar was pressed stop display
        if keyCode(stopkey)
            break;
        end
        
% Clear the screen
sca;

