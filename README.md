<a id="readme-top"></a>
# BatchPDF-Creator
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]
<br>
[![ShellCheck Analysis][shell-check-shield]][shell-check-url]
[![Codacy Security Scan][codacy-shield]][codacy-url]
[![Bandit Security Scan][bandit-shield]][bandit-url]
[![Bash Formatting Check][bashcheck-shield]][bashcheck-url]
<br>
[![PRs welcome][pr-shield]][pr-url]
[![made with hearth by miguerubsk][made-shield]][made-url]

<div align="center">
  BatchPDF-Creator
  <br />
  <a href="#about"><strong>Explore the docs »</strong></a>
  <br />
  <br />
  <a href="https://github.com/miguerubsk/BatchPDF-Creator/issues/new?assignees=miguerubsk&labels=bug&template=01_BUG_REPORT.md&title=%5BBUG%5D+">Report a Bug</a>
  ·
  <a href="https://github.com/miguerubsk/BatchPDF-Creator/issues/new?assignees=&labels=enhancement&template=02_FEATURE_REQUEST.md&title=%5BFEATURE%5D+">Request a Feature</a>
  .
  <a href="https://github.com/miguerubsk/BatchPDF-Creator/issues/new?assignees=&labels=question&template=04_SUPPORT_QUESTION.md&title=%5BSUPPORT%5D+">Ask a Question</a>
</div>



<details open="open">
<summary>Table of Contents</summary>

- [About](#about)
  - [Built With](#built-with)
  - [Features](#features)
  - [Supported Formats](#supported-formats)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Usage](#usage)
- [How It Works](#how-it-works)
  - [Example](#example)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [Support](#support)
- [Project assistance](#project-assistance)
- [Authors & contributors](#authors--contributors)
- [Security](#security)
- [License](#license)
- [Contact](#contact)
- [Acknowledgements](#acknowledgments)

</details>

---

## About

This Bash script automates the process of converting images in various formats into PDF files. It processes directories that do not contain subdirectories, converts incompatible image formats to PNG, and generates PDFs using `img2pdf`. The script also logs its operations and provides a final summary.

### Built With
- Bash
- ImageMagick (for image conversion)
- img2pdf (for PDF generation)

### Features
- Scans directories and processes only those without subdirectories.
- Converts images in unsupported formats (BMP, WEBP, GIF, SVG) to PNG.
- Generates a PDF containing all images found in a directory.
- Logs every step of the process.
- Provides a final summary with statistics on directories processed, images converted, PDFs generated, and errors encountered.

### Supported Formats
- Compatible formats: JPG, JPEG, PNG, TIFF
- Incompatible formats (converted to PNG first): BMP, WEBP, GIF, SVG

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

### Prerequisites
Ensure that the required dependencies are installed:
```sh
sudo apt update && sudo apt install -y img2pdf imagemagick
```

### Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/miguerubsk/BatchPDF-Creator.git
   cd BatchPDF-Creator
   ```
2. Make the script executable:
   ```sh
   chmod +x generate_pdf.sh
   ```

### Usage
Run the script in the directory where your images are located:
```sh
./generate_pdf.sh
```
This will:
- Process all directories without subdirectories.
- Convert unsupported images to PNG if necessary.
- Generate a PDF for each processed directory.
- Provide a final summary with statistics.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## How It Works

1.  The script scans directories (without subdirectories) for image files.
    
2.  Compatible images are directly added to the PDF queue.
    
3.  Incompatible images are converted to PNG using `convert` (ImageMagick).
    
4.  All images in a directory are merged into a single PDF using `img2pdf`.
    
5.  Temporary converted images are deleted after processing.
    
6.  A log file (`pdf_generation.log`) records all operations.

### Example

Assuming the following directory structure:

```
images/
├── album1/
│   ├── photo1.jpg
│   ├── photo2.png
│   ├── old_scan.bmp
├── album2/
│   ├── picture1.webp
│   ├── picture2.gif

```

Running the script:

```bash
./generate_pdfs.sh

```

Expected output:

```
📂 Processing directory: album1
📸 Found 3 images in album1.
📄 Creating PDF: album1/album1.pdf
✅ PDF successfully created: album1/album1.pdf

📂 Processing directory: album2
🔄 Converting picture1.webp → .converted_images/picture1.webp.png
🔄 Converting picture2.gif → .converted_images/picture2.gif.png
📸 Found 2 images in album2.
📄 Creating PDF: album2/album2.pdf
✅ PDF successfully created: album2/album2.pdf

```

After execution, PDFs will be generated in their respective directories, and the temporary `.converted_images` directory will be deleted.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Roadmap
- [x] Add support for multiple image formats.
- [x] Include logging for process tracking.
- [ ] Add a version for Windows.
- [ ] Support more advanced image processing features.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Support

Reach out to the maintainer at one of the following places:

- [GitHub issues](https://github.com/miguerubsk/BatchPDF-Creator/issues/new?assignees=&labels=question&template=04_SUPPORT_QUESTION.md&title=support%3A+)
- Contact options listed on [this GitHub profile](https://github.com/miguerubsk)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Project Assistance

If you want to say **thank you** or/and support active development of PROJECT_NAME:

- Add a [GitHub Star](https://github.com/miguerubsk/BatchPDF-Creator) to the project.
- Tweet about the BatchPDF-Creator.
- Write interesting articles about the project on [Dev.to](https://dev.to/), [Medium](https://medium.com/) or your personal blog.

Together, we can make BatchPDF-Creator **better**!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contributing
Contributions are welcome! To contribute:
1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Authors & Contributors

The original setup of this repository is by [Miguel González García](https://github.com/miguerubsk).

For a full list of all authors and contributors, see [the contributors page](https://github.com/miguerubsk/BatchPDF-Creator/contributors).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Security

BatchPDF-Creator follows good practices of security, but 100% security cannot be assured.
BatchPDF-Creator is provided **"as is"** without any **warranty**. Use at your own risk.

_For more information and to report security issues, please refer to our [security documentation](docs/SECURITY.md)._

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## License
Distributed under the GPL-3.0 license. See `LICENSE` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contact
Miguel González García - [@migueru98](https://twitter.com/migueru98) - [miguerubsk@gmail.com](mailto:miguerubsk@gmail.com)

Project Link: [BatchPDF-Creator](https://github.com/miguerubsk/BatchPDF-Creator)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Acknowledgments
- [ImageMagick](https://imagemagick.org/)
- [img2pdf](https://github.com/josch/img2pdf)
- [Bash Scripting Guide](https://tldp.org/LDP/abs/html/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/miguerubsk/BatchPDF-Creator.svg?style=for-the-badge
[contributors-url]: https://github.com/miguerubsk/BatchPDF-Creator/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/miguerubsk/BatchPDF-Creator.svg?style=for-the-badge
[forks-url]: https://github.com/miguerubsk/BatchPDF-Creator/network/members
[stars-shield]: https://img.shields.io/github/stars/miguerubsk/BatchPDF-Creator.svg?style=for-the-badge
[stars-url]: https://github.com/miguerubsk/BatchPDF-Creator/stargazers
[issues-shield]: https://img.shields.io/github/issues/miguerubsk/BatchPDF-Creator.svg?style=for-the-badge
[issues-url]: https://github.com/miguerubsk/BatchPDF-Creator/issues
[license-shield]: https://img.shields.io/github/license/miguerubsk/BatchPDF-Creator.svg?style=for-the-badge
[license-url]: https://github.com/miguerubsk/BatchPDF-Creator/blob/master/LICENSE
[shell-check-shield]:https://github.com/miguerubsk/BatchPDF-Creator/actions/workflows/ShellCheckAnalysis.yml/badge.svg?branch=master
[shell-check-url]: https://github.com/miguerubsk/BatchPDF-Creator/actions/workflows/ShellCheckAnalysis.yml
[codacy-shield]: https://github.com/miguerubsk/BatchPDF-Creator/actions/workflows/codacy.yml/badge.svg
[codacy-url]: https://github.com/miguerubsk/BatchPDF-Creator/actions/workflows/codacy.yml
[pr-shield]: https://img.shields.io/badge/PRs-welcome-ff69b4.svg?style=flat-square
[pr-url]: https://github.com/miguerubsk/BatchPDF-Creator/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22
[made-shield]: https://img.shields.io/badge/made%20with%20%E2%99%A5%20by-miguerubsk-ff1414.svg?style=flat-square
[made-url]: https://github.com/miguerubsk
[bandit-shield]: https://github.com/miguerubsk/BatchPDF-Creator/actions/workflows/bandit.yml/badge.svg
[bandit-url]: https://github.com/miguerubsk/BatchPDF-Creator/actions/workflows/bandit.yml
[bashcheck-shield]: https://github.com/miguerubsk/BatchPDF-Creator/actions/workflows/bashFcheck.yml/badge.svg
[bashcheck-url]: https://github.com/miguerubsk/BatchPDF-Creator/actions/workflows/bashFcheck.yml
