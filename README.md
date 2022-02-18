<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn-Issa][linkedin-shield]][linkedin-url-issa]
[![LinkedIn-Victoria][linkedin-shield]][linkedin-url-tori]
[![LinkedIn-Mothupi][linkedin-shield]][linkedin-url-mothupi]
[![LinkedIn-Paulo][linkedin-shield]][linkedin-url-paulo]
[![LinkedIn-Aaron][linkedin-shield]][linkedin-url-aaron]
[![LinkedIn-Thabo][linkedin-shield]][linkedin-url-thabo]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/ToriBench/wethink-central-application">
    <img src="images/mbongo_logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">WeThink Central Application Database</h3>

  <p align="center">
    MVP Database structure and implementation for the BBD Grad Database fundamentals level-up. 
    <br />
    <a href="https://github.com/ToriBench/wethink-central-application/blob/main/README.md"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/ToriBench/wethink-central-application/issues">Report Bug</a>
    ·
    <a href="https://github.com/ToriBench/wethink-central-application/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://github.com/ToriBench/wethink-central-application/blob/main/README.md)

WeThink Central Application is a platform that enables potential student to determine which courses they would be eligible for based 
on their results. 

Here's why:
* One click university enquiry. 
* Find get your AP score.
* Quick links to your preferred university.

WeThink Central Application eliminates the need to submit academic application enquiries at multiple universities.

<p align="right">(<a href="#top">back to top</a>)</p>



### Database implementation built With

* [TSQL](https://docs.microsoft.com/en-us/sql/t-sql/language-reference)
* [SQL Server Management Studio](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)
* [AWS](https://aws.amazon.com/)
* [DBDiagram](https://dbdiagram.io/)
* [Git](https://git-scm.com/)

<p align="right">(<a href="#top">back to top</a>)</p>

### Notice

1. This project is not audited and should not be used in a production environment.
2. The project was build on Windows and has not been tested on any Linux distro.

<!-- GETTING STARTED -->
## Getting Started

Follow the steps below on how to run the project.

### Prerequisites

Please install the below required software in order to run the project.

* SQL Server Management Studio
  [SQL Server Management Studio](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)

* AWS for Cloud hosting (Alternatively, run in your local environment)
  [AWS](https://aws.amazon.com/)

* Git
  [Git](https://git-scm.com/)


### Installation  

1. Clone the repo
   ```sh
   git clone https://github.com/ToriBench/wethink-central-application.git
   ```
2. Open SQL Server Management Studio connect to your AWS instance. (If you're running a local instance skip to 3)
   ```sh
   Server type: Database Engine
   Server name: [AWS SERVER URL HERE]
   Authentication: SQL Server Authentication
   Login: [AWS USERNAME HERE]
   Password: [AWS PASSWORD HERE]
   
   Connect
   ```
3. Open the project in SSMS.
4. Once connected, you may begin running the scripts. First run WeThinkDB.sql 
   ```sh
   EXECUTE WeThinkDB.sql
   ```
5. Next, to populate the database run PopulateDB.sql 
   ```sh
   EXECUTE PopulateDB.sql
   ```
7. Now, you can experiment with all the User Defined Functions and Stored Procedures:

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- USAGE EXAMPLES -->
## Usage

_Please refer to the [Documentation](https://github.com/ToriBench/wethink-central-application/blob/main/README.md)_

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap

- [ ] Implement the UI
- [ ] Implement the Backend
- [ ] Add App security
- [ ] Multi-language Support
    - [ ] Zulu
    - [ ] Afrikaans
    - [ ] Sotho

See the [open issues](https://github.com/ToriBench/wethink-central-application/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

Issa Kalonji - [LinkedIn](https://www.linkedin.com/in/issa-kalonji-b301851ba/) - issa@bbd.co.za
Victoria Bench - [LinkedIn](https://www.linkedin.com/in/victoria-bench-258b1baa/) - victoriab@bbd.co.za
Aaron Sher - [LinkedIn](https://www.linkedin.com/in/aaron-sher-176704180/) - aaronsh@bbd.co.za
Mothupi Ramogayana - [LinkedIn](https://www.linkedin.com/in/mothupi-ramogayana-68849480/) - mothupir@bbd.co.za
Paulo Ngove - [LinkedIn](https://www.linkedin.com/in/paulo-ngove-374919125/) - paulon@bbd.co.za
Thabo Rachidi - [LinkedIn](https://www.linkedin.com/) - thaborach@bbd.co.za


Project Link: [https://github.com/ToriBench/wethink-central-application](https://github.com/ToriBench/wethink-central-application)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [BBD Software](https://bbdsoftware.com/)
* [AWS](https://aws.amazon.com/)
* [DBDiagram](https://dbdiagram.io/)
* [Git](https://git-scm.com/)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/ToriBench/wethink-central-application.svg?style=for-the-badge
[contributors-url]: https://github.com/ToriBench/wethink-central-application/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/ToriBench/wethink-central-application.svg?style=for-the-badge
[forks-url]: https://github.com/ToriBench/wethink-central-application/network/members
[stars-shield]: https://img.shields.io/github/stars/ToriBench/wethink-central-application.svg?style=for-the-badge
[stars-url]: https://github.com/ToriBench/wethink-central-application/stargazers
[issues-shield]: https://img.shields.io/github/issues/ToriBench/wethink-central-application.svg?style=for-the-badge
[issues-url]: https://github.com/ToriBench/wethink-central-application/issues
[license-shield]: https://img.shields.io/github/license/ToriBench/wethink-central-application.svg?style=for-the-badge
[license-url]: https://github.com/ToriBench/wethink-central-application/blob/main/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url-issa]: https://www.linkedin.com/in/issa-kalonji-b301851ba/
[linkedin-url-tori]: https://www.linkedin.com/in/victoria-bench-258b1baa/
[linkedin-url-mothupi]: https://www.linkedin.com/in/mothupi-ramogayana-68849480/
[linkedin-url-thabo]: https://www.linkedin.com/
[linkedin-url-paulo]: https://www.linkedin.com/in/paulo-ngove-374919125/
[linkedin-url-aaron]: https://www.linkedin.com/in/aaron-sher-176704180/
[product-screenshot]: diagrams/wethinkdb-diagram-rev1.png