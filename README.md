# Pokémon Database

This repository contains a **relational database** designed to manage **Pokémon** and **trainer** data. The database enforces **data integrity** through constraints and is optimized for efficient querying. It uses **TSQL** in **Microsoft SQL Server** and follows database design principles to create an **ERD** and five interlinked tables, supporting **data analysis queries**.

---

## Table of Contents
- [Project Overview](#project-overview)
  - [Database Structure](#database-structure)
  - [Data Integrity and Constraints](#data-integrity-and-constraints)
- [Technologies Used](#technologies-used)
- [Setup Instructions](#setup-instructions)
  - [Clone the Repository](#clone-the-repository)

---

## Project Overview

### Database Structure
The database consists of **five interlinked tables**, each designed to handle specific aspects of **Pokémon** and **trainer** data:
1. **Trainers**: Stores information about Pokémon trainers.
2. **Pokémon**: Stores details about individual Pokémon.
3. **Types**: Defines different types of Pokémon.
4. **Abilities**: Stores the abilities that Pokémon can have.
5. **Battles**: Tracks battles between Pokémon, linking trainers and Pokémon.

### Data Integrity and Constraints
The database ensures **data integrity** through various constraints:
- **Primary Keys**: Ensure unique identification for each record.
- **Foreign Keys**: Enforce relationships between tables (e.g., linking Pokémon to trainers).
- **Check Constraints**: Validate data (e.g., ensuring valid Pokémon types).
- **Normalization**: Ensures efficient storage and retrieval of data while minimizing redundancy.

---

## Technologies Used
- **TSQL** (Microsoft SQL Server) for database creation and management
- **ERD (Entity Relationship Diagram)** for database design
- **Relational Database** for efficient querying and storage

## Setup Instructions

### Clone the Repository
To get started, clone the repository:
```bash
git clone https://github.com/Guber430/Pok-mon-Database.git
cd Pok-mon-Database
