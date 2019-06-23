# PredictMDFull - Install PredictMD and all of its dependencies

<table>
    <tbody>
        <tr>
            <td>Repo Status</td>
            <td><a href="https://www.repostatus.org/#active">
            <img src="https://www.repostatus.org/badges/latest/active.svg"
            alt="Project Status: Active – The project has reached a stable,
            usable state and is being actively developed." /></a></td>
        </tr>
        <tr>
            <td>Travis CI</td>
            <td><a
            href="https://travis-ci.org/bcbi/PredictMDFull.jl/branches">
            <img
            src=
            "https://travis-ci.org/bcbi/PredictMDFull.jl.svg?branch=master"
            /></a></td>
        </tr>
        <tr>
            <td>CodeCov</td>
            <td>
            <a
        href="https://codecov.io/gh/bcbi/PredictMDFull.jl/branch/master">
            <img
            src=
"https://codecov.io/gh/bcbi/PredictMDFull.jl/branch/master/graph/badge.svg"
            /></a></td>
        </tr>
    </tbody>
</table>

PredictMDFull provides users with a convenient way of installing
[PredictMD](https://predictmd.net) and all of its Julia dependencies. It is
the recommended method of installing PredictMD.

| Table of Contents |
| ----------------- |
| [Installation](#installation) |

## Installation

PredictMDFull is registered in the Julia General registry. Therefore, to
install PredictMDFull, simply open Julia and run the following three lines:
```julia
import Pkg
Pkg.add("PredictMDFull")
import PredictMDFull
```
