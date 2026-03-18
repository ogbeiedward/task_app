% Edward Ogbei % Lab03 - Geometric Transformations % Computer Vision,
    Pattern Recognition and Image Retrieval % Laboratory 3 %
        Teacher : Joanna Kulawik,
    PhD

            classdef Lab03 <
        matlab.apps.AppBase

            % Properties corresponding to app components
              properties(Access = public) UIFigure matlab.ui.Figure

            % Axes Axes1 matlab.ui.control.UIAxes Axes2 matlab.ui.control
                  .UIAxes Axes3 matlab.ui.control.UIAxes Axes4 matlab.ui.control
                  .UIAxes

            % Buttons CloseButton matlab.ui.control.Button
              OpenButton matlab.ui.control.Button
              GrayButton matlab.ui.control.Button
              RestoreButton matlab.ui.control.Button
              BrighterButton matlab.ui.control.Button
              DarkerButton matlab.ui.control.Button
              NormalizationButton matlab.ui.control.Button
              FlipVertButton matlab.ui.control.Button
              FlipHorizButton matlab.ui.control.Button
              CutoutButton matlab.ui.control.Button ScaleButton matlab.ui
                  .control.Button RotationButton matlab.ui.control.Button

            % Edit Fields(numeric)
        RowEditField          matlab.ui.control.NumericEditField
        ColumnEditField       matlab.ui.control.NumericEditField
        ChannelEditField      matlab.ui.control.NumericEditField
        AngleEditField        matlab.ui.control.NumericEditField

        % Labels for Edit Fields
        RowLabel              matlab.ui.control.Label
        ColumnLabel           matlab.ui.control.Label
        ChannelLabel          matlab.ui.control.Label
        AngleLabel            matlab.ui.control.Label
    end

    % Image storage properties
    properties (Access = private)
        originalColorImage    % stores the original loaded color image
        originalGrayImage     % stores the original grayscale conversion
        currentColorImage     % stores the current (possibly processed) color image
        currentGrayImage      % stores the current (possibly processed) grayscale image
    end

    % Callbacks
    methods (Access = private)

        % Exercise 1 - Close button
        function CloseButtonPushed(app, ~)
            delete(app.UIFigure);
        end

                % Exercise 1 -
            Open button : load a color image and display in Axes1 function
                              OpenButtonPushed(app, ~)[file, path] = uigetfile(
            {'*.jpg;*.png;*.bmp', ... 'Image Files (*.jpg, *.png, *.bmp)'});
        if isequal (file, 0)
          return;
        end img = imread(fullfile(path, file));
        app.originalColorImage = img;
        app.currentColorImage = img;
        imshow(img, 'Parent', app.Axes1);
        title(app.Axes1, 'Original Color Image');
        end

                % Exercise 1 -
            Gray button
            : convert to grayscale and display in Axes2 function
                  GrayButtonPushed(app, ~) if isempty (app.originalColorImage)
                      uialert(app.UIFigure, 'Please load an image first.',
                              'No Image');
        return;
        end grayImg = rgb2gray(app.originalColorImage);
        app.originalGrayImage = grayImg;
        app.currentGrayImage = grayImg;
        imshow(grayImg, 'Parent', app.Axes2);
        title(app.Axes2, 'Grayscale Image');
        end

                % Exercise 2 -
            Restore button
            : revert both images to originals function RestoreButtonPushed(
                  app, ~) if isempty (app.originalColorImage)
                  uialert(app.UIFigure, 'Please load an image first.',
                          'No Image');
        return;
        end app.currentColorImage = app.originalColorImage;
        app.currentGrayImage = app.originalGrayImage;
        imshow(app.currentColorImage, 'Parent', app.Axes3);
        title(app.Axes3, 'Restored Color');
        imshow(app.currentGrayImage, 'Parent', app.Axes4);
        title(app.Axes4, 'Restored Grayscale');
        end

                    % Exercise 3 -
                Brighter button
            : increase pixel values by 10 function
                  BrighterButtonPushed(app,
                                       ~) if isempty (app.currentColorImage) ||
            isempty(app.currentGrayImage) uialert(
                app.UIFigure,
                ... 'Please load an image and convert to grayscale first.',
                'No Image');
        return;
        end app.currentColorImage = app.currentColorImage + 10;
        app.currentGrayImage = app.currentGrayImage + 10;
        imshow(app.currentColorImage, 'Parent', app.Axes3);
        title(app.Axes3, 'Brightened Color');
        imshow(app.currentGrayImage, 'Parent', app.Axes4);
        title(app.Axes4, 'Brightened Grayscale');
        end

                    % Exercise 4 -
                Darker button
            : decrease pixel values by 10 function
                  DarkerButtonPushed(app,
                                     ~) if isempty (app.currentColorImage) ||
            isempty(app.currentGrayImage) uialert(
                app.UIFigure,
                ... 'Please load an image and convert to grayscale first.',
                'No Image');
        return;
        end app.currentColorImage = app.currentColorImage - 10;
        app.currentGrayImage = app.currentGrayImage - 10;
        imshow(app.currentColorImage, 'Parent', app.Axes3);
        title(app.Axes3, 'Darkened Color');
        imshow(app.currentGrayImage, 'Parent', app.Axes4);
        title(app.Axes4, 'Darkened Grayscale');
        end

                    % Exercise 5 -
                Normalization button
            : apply imadjust function NormalizationButtonPushed(
                  app, ~) if isempty (app.currentColorImage) ||
            isempty(app.currentGrayImage) uialert(
                app.UIFigure,
                ... 'Please load an image and convert to grayscale first.',
                'No Image');
        return;
        end app.currentColorImage = imadjust(app.currentColorImage);
        app.currentGrayImage = imadjust(app.currentGrayImage);
        imshow(app.currentColorImage, 'Parent', app.Axes3);
        title(app.Axes3, 'Normalized Color');
        imshow(app.currentGrayImage, 'Parent', app.Axes4);
        title(app.Axes4, 'Normalized Grayscale');
        end

                    % Exercise 6 -
                Flip vertically button
            : flipud function FlipVertButtonPushed(app, ~) if isempty (
                  app.currentColorImage) ||
            isempty(app.currentGrayImage) uialert(
                app.UIFigure,
                ... 'Please load an image and convert to grayscale first.',
                'No Image');
        return;
        end app.currentColorImage = flipud(app.currentColorImage);
        app.currentGrayImage = flipud(app.currentGrayImage);
        imshow(app.currentColorImage, 'Parent', app.Axes3);
        title(app.Axes3, 'Flipped Vertically - Color');
        imshow(app.currentGrayImage, 'Parent', app.Axes4);
        title(app.Axes4, 'Flipped Vertically - Grayscale');
        end

                    % Exercise 7 -
                Flip horizontally button
            : fliplr function FlipHorizButtonPushed(app, ~) if isempty (
                  app.currentColorImage) ||
            isempty(app.currentGrayImage) uialert(
                app.UIFigure,
                ... 'Please load an image and convert to grayscale first.',
                'No Image');
        return;
        end app.currentColorImage = fliplr(app.currentColorImage);
        app.currentGrayImage = fliplr(app.currentGrayImage);
        imshow(app.currentColorImage, 'Parent', app.Axes3);
        title(app.Axes3, 'Flipped Horizontally - Color');
        imshow(app.currentGrayImage, 'Parent', app.Axes4);
        title(app.Axes4, 'Flipped Horizontally - Grayscale');
        end

                    % Exercise 8 -
                Cut -
                out quarter button
            : crop the upper -
              left quarter function CutoutButtonPushed(app, ~) if isempty (
                  app.currentColorImage) ||
            isempty(app.currentGrayImage) uialert(
                app.UIFigure,
                ... 'Please load an image and convert to grayscale first.',
                'No Image');
        return;
        end % Color image - get size and crop upper -
            left quarter[rowsC, colsC, ~] = size(app.currentColorImage);
        halfRowC = floor(rowsC / 2);
        halfColC = floor(colsC / 2);
        app.currentColorImage =
            app.currentColorImage(1 : halfRowC, 1 : halfColC, :);

        % Grayscale image - get size and crop upper -
            left quarter[rowsG, colsG] = size(app.currentGrayImage);
        halfRowG = floor(rowsG / 2);
        halfColG = floor(colsG / 2);
        app.currentGrayImage = app.currentGrayImage(1 : halfRowG, 1 : halfColG);

        imshow(app.currentColorImage, 'Parent', app.Axes3);
        title(app.Axes3, 'Quarter - Color');
        imshow(app.currentGrayImage, 'Parent', app.Axes4);
        title(app.Axes4, 'Quarter - Grayscale');
        end

                    % Exercise 9 -
                Scale button
            : resize images using imresize3 and imresize function
                  ScaleButtonPushed(app,
                                    ~) if isempty (app.currentColorImage) ||
            isempty(app.currentGrayImage) uialert(
                app.UIFigure,
                ... 'Please load an image and convert to grayscale first.',
                'No Image');
        return;
        end rowVal = app.RowEditField.Value;
        colVal = app.ColumnEditField.Value;
        chVal = app.ChannelEditField.Value;

        % Resize color image using imresize3(3 -
                                             D resize) app.currentColorImage =
            imresize3(app.currentColorImage, ...[rowVal colVal chVal]);

        % Resize grayscale image using imresize(2 -
                                                D resize) app.currentGrayImage =
            imresize(app.currentGrayImage, ...[rowVal colVal]);

        imshow(app.currentColorImage, 'Parent', app.Axes3);
        title(app.Axes3, 'Scaled Color');
        imshow(app.currentGrayImage, 'Parent', app.Axes4);
        title(app.Axes4, 'Scaled Grayscale');
        end

                    % Exercise 10 -
                Rotation button
            : rotate images by the specified angle function
                  RotationButtonPushed(app,
                                       ~) if isempty (app.currentColorImage) ||
            isempty(app.currentGrayImage) uialert(
                app.UIFigure,
                ... 'Please load an image and convert to grayscale first.',
                'No Image');
        return;
        end angle = app.AngleEditField.Value;

        app.currentColorImage = imrotate(app.currentColorImage, angle);
        app.currentGrayImage = imrotate(app.currentGrayImage, angle);

        imshow(app.currentColorImage, 'Parent', app.Axes3);
        title(app.Axes3, 'Rotated Color');
        imshow(app.currentGrayImage, 'Parent', app.Axes4);
        title(app.Axes4, 'Rotated Grayscale');
        end end

            % Component initialization methods(Access = private)

                  function createComponents(app)

            % Create UIFigure and set properties app.UIFigure =
            uifigure('Visible', 'off');
        app.UIFigure.Position = [100 50 1300 720];
        app.UIFigure.Name = 'Lab03 - Geometric Transformations';

        % -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --%
            Button layout(left panel) %
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --btnW =
            150;
        btnH = 32;
        btnX = 15;
        gap = 5;
        y = 675;   % starting y for the top-most button

            % 1 - Close
            app.CloseButton = uibutton(app.UIFigure, 'push');
        app.CloseButton.ButtonPushedFcn =
            createCallbackFcn(app, @CloseButtonPushed, true);
        app.CloseButton.Position = [btnX y btnW btnH];
        app.CloseButton.Text = 'Close';

        % 2 - Open y = y - btnH - gap;
        app.OpenButton = uibutton(app.UIFigure, 'push');
        app.OpenButton.ButtonPushedFcn =
            createCallbackFcn(app, @OpenButtonPushed, true);
        app.OpenButton.Position = [btnX y btnW btnH];
        app.OpenButton.Text = 'Open';

        % 3 - Gray y = y - btnH - gap;
        app.GrayButton = uibutton(app.UIFigure, 'push');
        app.GrayButton.ButtonPushedFcn =
            createCallbackFcn(app, @GrayButtonPushed, true);
        app.GrayButton.Position = [btnX y btnW btnH];
        app.GrayButton.Text = 'Gray';

        % 4 - Restore y = y - btnH - gap;
        app.RestoreButton = uibutton(app.UIFigure, 'push');
        app.RestoreButton.ButtonPushedFcn =
            createCallbackFcn(app, @RestoreButtonPushed, true);
        app.RestoreButton.Position = [btnX y btnW btnH];
        app.RestoreButton.Text = 'Restore';

        % 5 - Brighter y = y - btnH - gap;
        app.BrighterButton = uibutton(app.UIFigure, 'push');
        app.BrighterButton.ButtonPushedFcn =
            createCallbackFcn(app, @BrighterButtonPushed, true);
        app.BrighterButton.Position = [btnX y btnW btnH];
        app.BrighterButton.Text = 'Brighter';

        % 6 - Darker y = y - btnH - gap;
        app.DarkerButton = uibutton(app.UIFigure, 'push');
        app.DarkerButton.ButtonPushedFcn =
            createCallbackFcn(app, @DarkerButtonPushed, true);
        app.DarkerButton.Position = [btnX y btnW btnH];
        app.DarkerButton.Text = 'Darker';

        % 7 - Normalization y = y - btnH - gap;
        app.NormalizationButton = uibutton(app.UIFigure, 'push');
        app.NormalizationButton.ButtonPushedFcn =
            createCallbackFcn(app, @NormalizationButtonPushed, true);
        app.NormalizationButton.Position = [btnX y btnW btnH];
        app.NormalizationButton.Text = 'Normalization';

        % 8 - Flip vertically y = y - btnH - gap;
        app.FlipVertButton = uibutton(app.UIFigure, 'push');
        app.FlipVertButton.ButtonPushedFcn =
            createCallbackFcn(app, @FlipVertButtonPushed, true);
        app.FlipVertButton.Position = [btnX y btnW btnH];
        app.FlipVertButton.Text = 'Flip vertically';

        % 9 - Flip horizontally y = y - btnH - gap;
        app.FlipHorizButton = uibutton(app.UIFigure, 'push');
        app.FlipHorizButton.ButtonPushedFcn =
            createCallbackFcn(app, @FlipHorizButtonPushed, true);
        app.FlipHorizButton.Position = [btnX y btnW btnH];
        app.FlipHorizButton.Text = 'Flip horizontally';

        % 10 - Cut - out quarter y = y - btnH - gap;
        app.CutoutButton = uibutton(app.UIFigure, 'push');
        app.CutoutButton.ButtonPushedFcn =
            createCallbackFcn(app, @CutoutButtonPushed, true);
        app.CutoutButton.Position = [btnX y btnW btnH];
        app.CutoutButton.Text = 'Cut-out quarter';

        % 11 - Scale y = y - btnH - gap;
        app.ScaleButton = uibutton(app.UIFigure, 'push');
        app.ScaleButton.ButtonPushedFcn =
            createCallbackFcn(app, @ScaleButtonPushed, true);
        app.ScaleButton.Position = [btnX y btnW btnH];
        app.ScaleButton.Text = 'Scale';

        % 12 - Rotation y = y - btnH - gap;
        app.RotationButton = uibutton(app.UIFigure, 'push');
        app.RotationButton.ButtonPushedFcn =
            createCallbackFcn(app, @RotationButtonPushed, true);
        app.RotationButton.Position = [btnX y btnW btnH];
        app.RotationButton.Text = 'Rotation';

        % -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --%
            Edit Fields(below buttons) %
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --lblX =
            15;
        efX = 90;
        efW = 70;
        efH = 22;

        % Row y = y - btnH - 15;
        app.RowLabel = uilabel(app.UIFigure);
        app.RowLabel.Position = [lblX y 70 efH];
        app.RowLabel.Text = 'Row:';
        app.RowEditField = uieditfield(app.UIFigure, 'numeric');
        app.RowEditField.Position = [efX y efW efH];
        app.RowEditField.Value = 50;

        % Column y = y - efH - gap;
        app.ColumnLabel = uilabel(app.UIFigure);
        app.ColumnLabel.Position = [lblX y 70 efH];
        app.ColumnLabel.Text = 'Column:';
        app.ColumnEditField = uieditfield(app.UIFigure, 'numeric');
        app.ColumnEditField.Position = [efX y efW efH];
        app.ColumnEditField.Value = 50;

        % Channel y = y - efH - gap;
        app.ChannelLabel = uilabel(app.UIFigure);
        app.ChannelLabel.Position = [lblX y 70 efH];
        app.ChannelLabel.Text = 'Channel:';
        app.ChannelEditField = uieditfield(app.UIFigure, 'numeric');
        app.ChannelEditField.Position = [efX y efW efH];
        app.ChannelEditField.Value = 3;

        % Angle y = y - efH - gap;
        app.AngleLabel = uilabel(app.UIFigure);
        app.AngleLabel.Position = [lblX y 70 efH];
        app.AngleLabel.Text = 'Angle:';
        app.AngleEditField = uieditfield(app.UIFigure, 'numeric');
        app.AngleEditField.Position = [efX y efW efH];
        app.AngleEditField.Value = 0;
        app.AngleEditField.Limits = [-360 360];

        % -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --%
            Axes(2 x 2 grid on the right side of the window) %
            -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --axW =
            470;
        axH = 310;
        axX1 = 190;
        % left column of axes axX2 = 700;
        % right column of axes axYtop = 380;
        % top row y - position axYbot = 40;
        % bottom row y -
            position

                % Axes1 -
            Original Color Image(top - left) app.Axes1 = uiaxes(app.UIFigure);
        app.Axes1.Position = [axX1 axYtop axW axH];
        title(app.Axes1, 'Axes1 - Original Color');

        % Axes2 - Grayscale Image(top - right) app.Axes2 = uiaxes(app.UIFigure);
        app.Axes2.Position = [axX2 axYtop axW axH];
        title(app.Axes2, 'Axes2 - Grayscale');

        % Axes3 - Processed Color Image(bottom -
                                        left) app.Axes3 = uiaxes(app.UIFigure);
        app.Axes3.Position = [axX1 axYbot axW axH];
        title(app.Axes3, 'Axes3 - Processed Color');

        % Axes4 -
            Processed Grayscale Image(bottom -
                                      right) app.Axes4 = uiaxes(app.UIFigure);
        app.Axes4.Position = [axX2 axYbot axW axH];
        title(app.Axes4, 'Axes4 - Processed Grayscale');

        % Show the figure after everything is set up app.UIFigure.Visible =
            'on';
        end end

            % App creation and deletion methods(Access = public)

            % Constructor function app = Lab03 createComponents(app);
        registerApp(app, app.UIFigure);

        if nargout
          == 0 clear app;
        end end

            % Destructor function delete (app) delete (app.UIFigure);
        end end end
