# Lab04 - Image Filtering App (MATLAB App Designer)

## Step-by-step guide to create Lab04.mlapp

### Step 1: Open App Designer
Type `appdesigner` in MATLAB Command Window. Click **Blank App**.

### Step 2: Add UI Components (Design View)
From the **Component Library** panel, drag and drop:

**Buttons (10 total)** - drag `Button` from the library and rename each:

| # | Button Text |
|---|------------|
| 1 | Close |
| 2 | Open |
| 3 | Noise S&P |
| 4 | Noise Gauss |
| 5 | Average |
| 6 | Gaussian |
| 7 | Prewitt |
| 8 | Sobel |
| 9 | Laplacian |
| 10 | Log |

Stack the buttons vertically on the **left side** of the form.

**Axes (6 total)** - drag `Axes` from the library:
- **Top row:** UIAxes, UIAxes2, UIAxes3 (for original, S&P noise, Gaussian noise)
- **Bottom row:** UIAxes4, UIAxes5, UIAxes6 (for filtered results)

### Step 3: Add Properties (Code View)
1. Switch to **Code View**
2. Click the **Properties** dropdown (green +) > **Private Property**
3. Add these three properties:

```matlab
properties (Access = private)
    image              % original loaded image
    image_noiseSP      % salt and pepper noisy image
    image_noiseGauss   % gaussian noisy image
end
```

### Step 4: Add Callbacks
For each button, right-click it in Design View > **Callbacks** > **Add ButtonPushedFcn callback**. Then paste the code below into each callback function.

---

#### Close button callback:
```matlab
function CloseButtonPushed(app, event)
    close(app.UIFigure);
end
```

#### Open button callback:
```matlab
function OpenButtonPushed(app, event)
    [file, path] = uigetfile({'*.jpg;*.png;*.bmp', 'Image Files (*.jpg, *.png, *.bmp)'});
    if isequal(file, 0)
        return;
    end
    app.image = imread(fullfile(path, file));
    imshow(app.image, 'Parent', app.UIAxes);
end
```

#### Noise S&P button callback:
```matlab
function NoiseSPButtonPushed(app, event)
    app.image_noiseSP = imnoise(app.image, 'salt & pepper');
    imshow(app.image_noiseSP, 'Parent', app.UIAxes2);
end
```

#### Noise Gauss button callback:
```matlab
function NoiseGaussButtonPushed(app, event)
    app.image_noiseGauss = imnoise(app.image, 'gaussian');
    imshow(app.image_noiseGauss, 'Parent', app.UIAxes3);
end
```

#### Average button callback:
```matlab
function AverageButtonPushed(app, event)
    f = fspecial('average');
    imshow(imfilter(app.image, f), 'Parent', app.UIAxes4);
    imshow(imfilter(app.image_noiseSP, f), 'Parent', app.UIAxes5);
    imshow(imfilter(app.image_noiseGauss, f), 'Parent', app.UIAxes6);
end
```

#### Gaussian button callback:
```matlab
function GaussianButtonPushed(app, event)
    f = fspecial('gaussian');
    imshow(imfilter(app.image, f), 'Parent', app.UIAxes4);
    imshow(imfilter(app.image_noiseSP, f), 'Parent', app.UIAxes5);
    imshow(imfilter(app.image_noiseGauss, f), 'Parent', app.UIAxes6);
end
```

#### Prewitt button callback:
```matlab
function PrewittButtonPushed(app, event)
    f = fspecial('prewitt');
    imshow(imfilter(im2double(app.image), f), 'Parent', app.UIAxes4);
    imshow(imfilter(im2double(app.image_noiseSP), f), 'Parent', app.UIAxes5);
    imshow(imfilter(im2double(app.image_noiseGauss), f), 'Parent', app.UIAxes6);
end
```

#### Sobel button callback:
```matlab
function SobelButtonPushed(app, event)
    f = fspecial('sobel');
    imshow(imfilter(im2double(app.image), f), 'Parent', app.UIAxes4);
    imshow(imfilter(im2double(app.image_noiseSP), f), 'Parent', app.UIAxes5);
    imshow(imfilter(im2double(app.image_noiseGauss), f), 'Parent', app.UIAxes6);
end
```

#### Laplacian button callback:
```matlab
function LaplacianButtonPushed(app, event)
    f = fspecial('laplacian');
    imshow(imfilter(im2double(app.image), f), 'Parent', app.UIAxes4);
    imshow(imfilter(im2double(app.image_noiseSP), f), 'Parent', app.UIAxes5);
    imshow(imfilter(im2double(app.image_noiseGauss), f), 'Parent', app.UIAxes6);
end
```

#### Log button callback:
```matlab
function LogButtonPushed(app, event)
    f = fspecial('log');
    imshow(imfilter(im2double(app.image), f), 'Parent', app.UIAxes4);
    imshow(imfilter(im2double(app.image_noiseSP), f), 'Parent', app.UIAxes5);
    imshow(imfilter(im2double(app.image_noiseGauss), f), 'Parent', app.UIAxes6);
end
```

### Step 5: Save
Save the app as **Lab04.mlapp**. Submit this file to Moodle.

### Usage Order
1. **Open** - load an image
2. **Noise S&P** + **Noise Gauss** - create noisy versions
3. Click any filter button to see results across all three images

> [!IMPORTANT]
> The axes names (UIAxes, UIAxes2, etc.) must match what App Designer auto-generates. If your axes have different names, update the callback code to match.
