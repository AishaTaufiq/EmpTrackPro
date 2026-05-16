import pandas as pd
import os

base_path = os.path.dirname(__file__)

# Load file
file_path = os.path.join(base_path, "Data Set Employee Management.xlsx")
df = pd.read_excel(file_path)

# Clean columns
df.columns = df.columns.str.strip()

# Fill missing values
df = df.fillna("")

# Standardize text columns
text_cols = ["Prefix", "First Name", "Last Name", "Full Name",
             "Job Title", "Department", "TEAMS", "System",
             "Job Status", "Employment type"]

for col in text_cols:
    if col in df.columns:
        df[col] = df[col].astype(str).str.strip()

# Fix salary
if "Salary" in df.columns:
    df["Salary"] = df["Salary"].astype(str).str.replace(",", "", regex=True)
    df["Salary"] = pd.to_numeric(df["Salary"], errors="coerce")

# Fix dates
date_cols = ["Job Start Date", "Exit Date"]

for col in date_cols:
    if col in df.columns:
        df[col] = pd.to_datetime(df[col], errors="coerce")

# Remove duplicates
if "Employe No" in df.columns:
    df = df.drop_duplicates(subset=["Employe No"])

# Save cleaned file (same folder)
output_path = os.path.join(base_path, "employees_clean.xlsx")
df.to_excel(output_path, index=False)

print("✅ Data cleaned successfully!")