# BatchPDF-Creator

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]
[![ShellCheck Analysis](https://github.com/miguerubsk/BatchPDF-Creator/actions/workflows/ShellCheckAnalysis.yml/badge.svg?branch=master)](https://github.com/miguerubsk/BatchPDF-Creator/actions/workflows/ShellCheckAnalysis.yml)
[![Codacy Security Scan](https://github.com/miguerubsk/BatchPDF-Creator/actions/workflows/codacy.yml/badge.svg)](https://github.com/miguerubsk/BatchPDF-Creator/actions/workflows/codacy.yml)

## About The Project

This Bash script automates the process of converting images in various formats into PDF files. It processes directories that do not contain subdirectories, converts incompatible image formats to PNG, and generates PDFs using `img2pdf`. The script also logs its operations and provides a final summary.

### Features
- Scans directories and processes only those without subdirectories.
- Converts images in unsupported formats (BMP, WEBP, GIF, SVG) to PNG.
- Generates a PDF containing all images found in a directory.
- Logs every step of the process.
- Provides a final summary with statistics on directories processed, images converted, PDFs generated, and errors encountered.

### Supported Formats
- Compatible formats: JPG, JPEG, PNG, TIFF
- Incompatible formats (converted to PNG first): BMP, WEBP, GIF, SVG

## How It Works

1.  The script scans directories (without subdirectories) for image files.
    
2.  Compatible images are directly added to the PDF queue.
    
3.  Incompatible images are converted to PNG using `convert` (ImageMagick).
    
4.  All images in a directory are merged into a single PDF using `img2pdf`.
    
5.  Temporary converted images are deleted after processing.
    
6.  A log file (`pdf_generation.log`) records all operations.

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
   git clone https://github.com/miguerubsk/BatchPDF-Creator.git
   cd BatchPDF-Creator
   ```
2. Make the script executable:
   ```sh
   chmod +x generate_pdf.sh
   ```

## Usage
Run the script in the directory where your images are located:
```sh
./generate_pdf.sh
```
This will:
- Process all directories without subdirectories.
- Convert unsupported images to PNG if necessary.
- Generate a PDF for each processed directory.
- Provide a final summary with statistics.

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

Project Link: [BatchPDF-Creator](https://github.com/miguerubsk/BatchPDF-Creator)

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

