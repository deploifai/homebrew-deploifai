import os
import sys

def parse_resource_stanzas_from_formula(formula):
    """Parse the resource stanzas from the formula."""
    stanzas = []
    not_end = False

    for line in formula:
        s = line.lstrip()
        if s.startswith("resource"):
            stanzas.append(line)
            not_end = True
        elif not_end:
            stanzas[-1] += line
            if s.startswith("end"):
                stanzas[-1] += "\n"
                not_end = False

    return stanzas


def generate_new_formula(placeholder_formula, resource_stanzas, new_version):
    """Generate the new formula."""

    new_formula = []

    for line in placeholder_formula:
        if line.lstrip().startswith("version"):
            new_formula.append(f'  version "{new_version}"\n')
        elif line.lstrip().startswith("## RESOURCES ##"):
            new_formula += resource_stanzas
        else:
            new_formula.append(line)

    return new_formula


if __name__ == "__main__":
    # get the new version from the first argument
    new_version = sys.argv[1]
    print(f"New version: {new_version}")
    if new_version is None:
        print("Please provide the new version as the first argument.")
        sys.exit(1)

    # remove the leading "v" if it exists
    if new_version.startswith("v"):
        new_version = new_version[1:]

    # filepaths
    source_formula_filepath = "deploifai.rb"
    placeholder_formula_filepath = "deploifai.placeholder.rb"
    target_formula_filepath = os.path.join(
        os.path.dirname(os.path.realpath(__file__)), os.pardir, "Formula", "deploifai.rb"
    )

    # parse the resource stanzas from the source formula
    formula_file = open(source_formula_filepath, "r")
    resource_stanzas = parse_resource_stanzas_from_formula(formula_file.readlines())
    formula_file.close()
    print(f"Number of resource stanzas: {len(resource_stanzas)}")

    # generate the new formula
    placeholder_formula_file = open("deploifai.placeholder.rb", "r")
    new_formula = generate_new_formula(
        placeholder_formula_file.readlines(), resource_stanzas, new_version
    )
    placeholder_formula_file.close()
    print(f"Number of lines in new formula: {len(new_formula)}")

    # write the new formula to the target file
    new_formula_file = open(target_formula_filepath, "w")
    new_formula_file.writelines(new_formula)
    new_formula_file.close()
    print("New formula written to deploifai.rb")
