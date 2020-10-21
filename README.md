# fruit_vegetable_classifier

#### the whole project was made using Visual Studio Code, so all of the instructions is by using VSCode.

---

## Getting Started

```
Flutter project - done with the course :
"Deep Learning Course with Flutter & Python - Build 6 AI Apps"
https://www.udemy.com/course/flutter-deeplearning-course/
```

This project is about:

- finding if the image contain a one of 131 types of fruits or vegetables.
- use Python to train a Neural Network (NN) and export a model,tflite file, to use on mobile devices.

This project was made in order to train in developing applications for iOS using Flutter framework.

---

## How to use:

Before starting, verify that you have and configured Python on your system:

```sh
python --version
```

For linux/mac:

```sh
python3 --version
```

Also verify that you have and configured properly flutter on your system:

```sh
flutter doctor
```

Make sure you have installed VSCode on your system.

---

First, we need to create our tflite file to use in our app:

### 1. open with vscode

```sh
code lib/python
```

### 2. In the VSCode window open terminal and run:

(This wiil create a virtual envirement(venv) to use in this project)

```sh
python -m venv .env
```

For linux/mac:

```sh
python3 -m venv .env
```

### 3. Activate our new venv:

<table>
<colgroup>
<col style="width: 18%">
<col style="width: 24%">
<col style="width: 58%">
</colgroup>
<thead>
<tr class="row-odd"><th class="head"><p>Platform</p></th>
<th class="head"><p>Shell</p></th>
<th class="head"><p>Command to activate virtual environment</p></th>
</tr>
</thead>
<tbody>
<tr class="row-even"><td><p>POSIX</p></td>
<td><p>bash/zsh</p></td>
<td><p>$ source &lt;venv&gt;/bin/activate</p></td>
</tr>
<tr class="row-odd"><td></td>
<td><p>fish</p></td>
<td><p>$ source &lt;venv&gt;/bin/activate.fish</p></td>
</tr>
<tr class="row-even"><td></td>
<td><p>csh/tcsh</p></td>
<td><p>$ source &lt;venv&gt;/bin/activate.csh</p></td>
</tr>
<tr class="row-odd"><td></td>
<td><p>PowerShell Core</p></td>
<td><p>$ &lt;venv&gt;/bin/Activate.ps1</p></td>
</tr>
<tr class="row-even"><td><p>Windows</p></td>
<td><p>cmd.exe</p></td>
<td><p>C:\&gt; &lt;venv&gt;\Scripts\activate.bat</p></td>
</tr>
<tr class="row-odd"><td></td>
<td><p>PowerShell</p></td>
<td><p>PS C:\&gt; &lt;venv&gt;\Scripts\Activate.ps1</p></td>
</tr>
</tbody>
</table>

### 4. Install all required libreries in order to use our jupyter notebook with vscode:

```sh
pip install -r requirments.txt
```

For linux/mac:

```sh
pip3 install -r requirments.txt
```

### 5. Open `create_tflite_file.ipynb` and run all cells with the 2 arrows button.

- `NOTE` - dependes on your computer, this stage can take a few minutes. you can watch the progress in last cells in the notebook.

### 6. On the root dir of your project you should see many new files and directories, but we want only 2:

- `model.tflite`
- `labels.txt`

### 7. Copy this 2 files to:

`<flutter_projects>/assets/tflite`

### 8. Open the flutter project and run it on your emulater/device.

- `NOTE` - before running, make sure to have a picture of a fruit on your phone, or use your camera.
