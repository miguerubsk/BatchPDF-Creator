# BatchPDF-Creator

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]

## About The Project

This Bash script automates the process of converting images in various formats into PDF files. It processes directories that do not contain subdirectories, converts incompatible image formats to PNG, and generates PDFs using `img2pdf`. The script also logs its operations and provides a final summary.

### Features
- Scans directories and processes only those without subdirectories.
- Converts images in unsupported formats (BMP, WEBP, GIF, SVG) to PNG.
- Generates a PDF containing all images found in a directory.
- Logs every step of the process.
- Provides a final summary with statistics on directories processed, images converted, PDFs generated, and errors encountered.

## Built With
- Bash
- ImageMagick (for image conversion)
- img2pdf (for PDF generation)

## Getting Started

To use this script, follow these steps.

### Prerequisites
Ensure that the required dependencies are installed:
```sh
sudo apt update && sudo apt install -y img2pdf imagemagick
```

### Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/your_username/pdf-generator.git
   cd pdf-generator
   ```
2. Make the script executable:
   ```sh
   chmod +x pdf_generator.sh
   ```

## Usage
Run the script in the directory where your images are located:
```sh
./pdf_generator.sh
```
This will:
- Process all directories without subdirectories.
- Convert unsupported images to PNG if necessary.
- Generate a PDF for each processed directory.
- Provide a final summary with statistics.

## Roadmap
- [x] Add support for multiple image formats.
- [x] Include logging for process tracking.
- [ ] Implement multi-threaded processing for faster execution.
- [ ] Support more advanced image processing features.

## Contributing
Contributions are welcome! To contribute:
1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License
Distributed under the GPL-3.0 license. See `LICENSE` for more information.

## Contact
Miguel González García - [@migueru98](https://twitter.com/migueru98) - miguerubsk@gmail.com

Project Link: [https://github.com/miguerubsk/BatchPDF-Creator](BatchPDF-Creator)

## Acknowledgments
- [ImageMagick](https://imagemagick.org/)
- [img2pdf](https://github.com/josch/img2pdf)
- [Bash Scripting Guide](https://tldp.org/LDP/abs/html/)

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

