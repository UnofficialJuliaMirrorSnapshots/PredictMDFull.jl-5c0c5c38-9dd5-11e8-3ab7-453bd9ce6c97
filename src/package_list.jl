##### Beginning of file

import PredictMDExtra

function _package_list()::Vector{String}
    predictmdextra_package_list::Vector{String} =
        PredictMDExtra._package_list()
    additional_package_list_raw::Vector{String} = String[
        "PredictMD",
        "PredictMDExtra",
        ]
    package_list_raw::Vector{String} = vcat(
        predictmdextra_package_list,
        additional_package_list_raw,
        )
    package_list::Vector{String} = sort(unique(strip.(package_list_raw)))
    return package_list
end

function _stdlib_list()::Vector{String}
    predictmdextra_stdlib_list::Vector{String} =
        PredictMDExtra._stdlib_list()
    additional_stdlib_list_raw::Vector{String} = String[
        "InteractiveUtils",
        "Pkg",
        "Test",
        ]
    stdlib_list_raw::Vector{String} = vcat(
        predictmdextra_stdlib_list,
        additional_stdlib_list_raw,
        )
    stdlib_list::Vector{String} = sort(unique(strip.(stdlib_list_raw)))
    return stdlib_list
end

##### End of file
