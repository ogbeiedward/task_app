classdef Lab04 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure           matlab.ui.Figure
        CloseButton        matlab.ui.control.Button
        OpenButton         matlab.ui.control.Button
        NoiseSPButton      matlab.ui.control.Button
        NoiseGaussButton   matlab.ui.control.Button
        AverageButton      matlab.ui.control.Button
        GaussianButton     matlab.ui.control.Button
        PrewittButton      matlab.ui.control.Button
        SobelButton        matlab.ui.control.Button
        LaplacianButton    matlab.ui.control.Button
        LogButton          matlab.ui.control.Button
        UIAxes1            matlab.ui.control.UIAxes
        UIAxes2            matlab.ui.control.UIAxes
        UIAxes3            matlab.ui.control.UIAxes
        UIAxes4            matlab.ui.control.UIAxes
        UIAxes5            matlab.ui.control.UIAxes
        UIAxes6            matlab.ui.control.UIAxes
    end

    % Properties to store image data
    properties (Access = private)
        image              % original loaded image
        image_noiseSP      % salt and pepper noisy image
        image_noiseGauss   % gaussian noisy image
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: CloseButton
        function CloseButtonPushed(app, event)
            close(app.UIFigure);
        end

        % Button pushed function: OpenButton
        function OpenButtonPushed(app, event)
            [file, path] = uigetfile({'*.jpg;*.png;*.bmp', 'Image Files (*.jpg, *.png, *.bmp)'});
            if isequal(file, 0)
                return;
            end
            app.image = imread(fullfile(path, file));
            imshow(app.image, 'Parent', app.UIAxes1);
            title(app.UIAxes1, 'Original Image');
        end

        % Button pushed function: NoiseSPButton
        function NoiseSPButtonPushed(app, event)
            if isempty(app.image)
                return;
            end
            app.image_noiseSP = imnoise(app.image, 'salt & pepper');
            imshow(app.image_noiseSP, 'Parent', app.UIAxes2);
            title(app.UIAxes2, 'Salt & Pepper Noise');
        end

        % Button pushed function: NoiseGaussButton
        function NoiseGaussButtonPushed(app, event)
            if isempty(app.image)
                return;
            end
            app.image_noiseGauss = imnoise(app.image, 'gaussian');
            imshow(app.image_noiseGauss, 'Parent', app.UIAxes3);
            title(app.UIAxes3, 'Gaussian Noise');
        end

        % Button pushed function: AverageButton
        function AverageButtonPushed(app, event)
            if isempty(app.image)
                return;
            end
            f = fspecial('average');
            image_avg = imfilter(app.image, f);
            imshow(image_avg, 'Parent', app.UIAxes4);
            title(app.UIAxes4, 'Original - Average');

            if ~isempty(app.image_noiseSP)
                image_avg_sp = imfilter(app.image_noiseSP, f);
                imshow(image_avg_sp, 'Parent', app.UIAxes5);
                title(app.UIAxes5, 'S&P - Average');
            end

            if ~isempty(app.image_noiseGauss)
                image_avg_gauss = imfilter(app.image_noiseGauss, f);
                imshow(image_avg_gauss, 'Parent', app.UIAxes6);
                title(app.UIAxes6, 'Gauss - Average');
            end
        end

        % Button pushed function: GaussianButton
        function GaussianButtonPushed(app, event)
            if isempty(app.image)
                return;
            end
            f = fspecial('gaussian');
            image_filt = imfilter(app.image, f);
            imshow(image_filt, 'Parent', app.UIAxes4);
            title(app.UIAxes4, 'Original - Gaussian');

            if ~isempty(app.image_noiseSP)
                image_filt_sp = imfilter(app.image_noiseSP, f);
                imshow(image_filt_sp, 'Parent', app.UIAxes5);
                title(app.UIAxes5, 'S&P - Gaussian');
            end

            if ~isempty(app.image_noiseGauss)
                image_filt_gauss = imfilter(app.image_noiseGauss, f);
                imshow(image_filt_gauss, 'Parent', app.UIAxes6);
                title(app.UIAxes6, 'Gauss - Gaussian');
            end
        end

        % Button pushed function: PrewittButton
        function PrewittButtonPushed(app, event)
            if isempty(app.image)
                return;
            end
            f = fspecial('prewitt');
            image_filt = imfilter(im2double(app.image), f);
            imshow(image_filt, 'Parent', app.UIAxes4);
            title(app.UIAxes4, 'Original - Prewitt');

            if ~isempty(app.image_noiseSP)
                image_filt_sp = imfilter(im2double(app.image_noiseSP), f);
                imshow(image_filt_sp, 'Parent', app.UIAxes5);
                title(app.UIAxes5, 'S&P - Prewitt');
            end

            if ~isempty(app.image_noiseGauss)
                image_filt_gauss = imfilter(im2double(app.image_noiseGauss), f);
                imshow(image_filt_gauss, 'Parent', app.UIAxes6);
                title(app.UIAxes6, 'Gauss - Prewitt');
            end
        end

        % Button pushed function: SobelButton
        function SobelButtonPushed(app, event)
            if isempty(app.image)
                return;
            end
            f = fspecial('sobel');
            image_filt = imfilter(im2double(app.image), f);
            imshow(image_filt, 'Parent', app.UIAxes4);
            title(app.UIAxes4, 'Original - Sobel');

            if ~isempty(app.image_noiseSP)
                image_filt_sp = imfilter(im2double(app.image_noiseSP), f);
                imshow(image_filt_sp, 'Parent', app.UIAxes5);
                title(app.UIAxes5, 'S&P - Sobel');
            end

            if ~isempty(app.image_noiseGauss)
                image_filt_gauss = imfilter(im2double(app.image_noiseGauss), f);
                imshow(image_filt_gauss, 'Parent', app.UIAxes6);
                title(app.UIAxes6, 'Gauss - Sobel');
            end
        end

        % Button pushed function: LaplacianButton
        function LaplacianButtonPushed(app, event)
            if isempty(app.image)
                return;
            end
            f = fspecial('laplacian');
            image_filt = imfilter(im2double(app.image), f);
            imshow(image_filt, 'Parent', app.UIAxes4);
            title(app.UIAxes4, 'Original - Laplacian');

            if ~isempty(app.image_noiseSP)
                image_filt_sp = imfilter(im2double(app.image_noiseSP), f);
                imshow(image_filt_sp, 'Parent', app.UIAxes5);
                title(app.UIAxes5, 'S&P - Laplacian');
            end

            if ~isempty(app.image_noiseGauss)
                image_filt_gauss = imfilter(im2double(app.image_noiseGauss), f);
                imshow(image_filt_gauss, 'Parent', app.UIAxes6);
                title(app.UIAxes6, 'Gauss - Laplacian');
            end
        end

        % Button pushed function: LogButton
        function LogButtonPushed(app, event)
            if isempty(app.image)
                return;
            end
            f = fspecial('log');
            image_filt = imfilter(im2double(app.image), f);
            imshow(image_filt, 'Parent', app.UIAxes4);
            title(app.UIAxes4, 'Original - LoG');

            if ~isempty(app.image_noiseSP)
                image_filt_sp = imfilter(im2double(app.image_noiseSP), f);
                imshow(image_filt_sp, 'Parent', app.UIAxes5);
                title(app.UIAxes5, 'S&P - LoG');
            end

            if ~isempty(app.image_noiseGauss)
                image_filt_gauss = imfilter(im2double(app.image_noiseGauss), f);
                imshow(image_filt_gauss, 'Parent', app.UIAxes6);
                title(app.UIAxes6, 'Gauss - LoG');
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1200 700];
            app.UIFigure.Name = 'Lab04 - Image Filtering';

            % Create buttons on the left side
            buttonWidth = 130;
            buttonHeight = 30;
            buttonX = 20;
            startY = 650;
            spacing = 40;

            % Close button
            app.CloseButton = uibutton(app.UIFigure, 'push');
            app.CloseButton.ButtonPushedFcn = createCallbackFcn(app, @CloseButtonPushed, true);
            app.CloseButton.Position = [buttonX startY buttonWidth buttonHeight];
            app.CloseButton.Text = 'Close';

            % Open button
            app.OpenButton = uibutton(app.UIFigure, 'push');
            app.OpenButton.ButtonPushedFcn = createCallbackFcn(app, @OpenButtonPushed, true);
            app.OpenButton.Position = [buttonX startY - spacing buttonWidth buttonHeight];
            app.OpenButton.Text = 'Open';

            % Noise S&P button
            app.NoiseSPButton = uibutton(app.UIFigure, 'push');
            app.NoiseSPButton.ButtonPushedFcn = createCallbackFcn(app, @NoiseSPButtonPushed, true);
            app.NoiseSPButton.Position = [buttonX startY - 2*spacing buttonWidth buttonHeight];
            app.NoiseSPButton.Text = 'Noise S&P';

            % Noise Gauss button
            app.NoiseGaussButton = uibutton(app.UIFigure, 'push');
            app.NoiseGaussButton.ButtonPushedFcn = createCallbackFcn(app, @NoiseGaussButtonPushed, true);
            app.NoiseGaussButton.Position = [buttonX startY - 3*spacing buttonWidth buttonHeight];
            app.NoiseGaussButton.Text = 'Noise Gauss';

            % Average button
            app.AverageButton = uibutton(app.UIFigure, 'push');
            app.AverageButton.ButtonPushedFcn = createCallbackFcn(app, @AverageButtonPushed, true);
            app.AverageButton.Position = [buttonX startY - 4*spacing buttonWidth buttonHeight];
            app.AverageButton.Text = 'Average';

            % Gaussian button
            app.GaussianButton = uibutton(app.UIFigure, 'push');
            app.GaussianButton.ButtonPushedFcn = createCallbackFcn(app, @GaussianButtonPushed, true);
            app.GaussianButton.Position = [buttonX startY - 5*spacing buttonWidth buttonHeight];
            app.GaussianButton.Text = 'Gaussian';

            % Prewitt button
            app.PrewittButton = uibutton(app.UIFigure, 'push');
            app.PrewittButton.ButtonPushedFcn = createCallbackFcn(app, @PrewittButtonPushed, true);
            app.PrewittButton.Position = [buttonX startY - 6*spacing buttonWidth buttonHeight];
            app.PrewittButton.Text = 'Prewitt';

            % Sobel button
            app.SobelButton = uibutton(app.UIFigure, 'push');
            app.SobelButton.ButtonPushedFcn = createCallbackFcn(app, @SobelButtonPushed, true);
            app.SobelButton.Position = [buttonX startY - 7*spacing buttonWidth buttonHeight];
            app.SobelButton.Text = 'Sobel';

            % Laplacian button
            app.LaplacianButton = uibutton(app.UIFigure, 'push');
            app.LaplacianButton.ButtonPushedFcn = createCallbackFcn(app, @LaplacianButtonPushed, true);
            app.LaplacianButton.Position = [buttonX startY - 8*spacing buttonWidth buttonHeight];
            app.LaplacianButton.Text = 'Laplacian';

            % Log button
            app.LogButton = uibutton(app.UIFigure, 'push');
            app.LogButton.ButtonPushedFcn = createCallbackFcn(app, @LogButtonPushed, true);
            app.LogButton.Position = [buttonX startY - 9*spacing buttonWidth buttonHeight];
            app.LogButton.Text = 'Log';

            % Create Axes - Top Row (original, noise SP, noise Gauss)
            axesX = 180;
            axesWidth = 320;
            axesHeight = 280;
            axesSpacing = 340;

            % UIAxes1 - Original image
            app.UIAxes1 = uiaxes(app.UIFigure);
            app.UIAxes1.Position = [axesX 380 axesWidth axesHeight];
            title(app.UIAxes1, 'Original Image');

            % UIAxes2 - Salt & Pepper noise
            app.UIAxes2 = uiaxes(app.UIFigure);
            app.UIAxes2.Position = [axesX + axesSpacing 380 axesWidth axesHeight];
            title(app.UIAxes2, 'Salt & Pepper Noise');

            % UIAxes3 - Gaussian noise
            app.UIAxes3 = uiaxes(app.UIFigure);
            app.UIAxes3.Position = [axesX + 2*axesSpacing 380 axesWidth axesHeight];
            title(app.UIAxes3, 'Gaussian Noise');

            % UIAxes4 - Filtered original
            app.UIAxes4 = uiaxes(app.UIFigure);
            app.UIAxes4.Position = [axesX 60 axesWidth axesHeight];
            title(app.UIAxes4, 'Filtered Original');

            % UIAxes5 - Filtered S&P
            app.UIAxes5 = uiaxes(app.UIFigure);
            app.UIAxes5.Position = [axesX + axesSpacing 60 axesWidth axesHeight];
            title(app.UIAxes5, 'Filtered S&P');

            % UIAxes6 - Filtered Gaussian
            app.UIAxes6 = uiaxes(app.UIFigure);
            app.UIAxes6.Position = [axesX + 2*axesSpacing 60 axesWidth axesHeight];
            title(app.UIAxes6, 'Filtered Gaussian');

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Lab04

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
