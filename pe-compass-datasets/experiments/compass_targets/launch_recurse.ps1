<#
    .SYNOPSIS
        Convenient Script for pe-compass recurse inspection.

        Expedites the baseline prototype
#>

function launch
{
    $_targets = "C:\Users\{{ ENTER USERNAME HERE }}\Desktop\pe-compass-datasets\experiments\compass_targets\";
    $_dumps = "C:\Users\{{ ENTER USERNAME HERE }}\Desktop\pe-compass-datasets\experiments\compass_dumps\";

    $_formats = @("json", "csv");

    $_extensions = @("acms",
                     "axs",
                     "coms",
                     "cpls",
                     "dlls",
                     "drvs",
                     "efis",
                     "exes",
                     "muis",
                     "ocxs",
                     "scrs",
                     "sys",
                     "tsps"   
                    );
    foreach ($format in $_formats) {
        foreach ($extension in $_extensions) {
            $_target_path = "${_targets}${extension}.txt";
            $_dump_path = "${_dumps}${extension}\${format}\";
            if ($format -eq "csv") {
                Get-Content "${_target_path}" | ForEach-Object { $b=[System.IO.Path]::GetFileName($_.Replace("'","")); pe-compass inspect -f $_.Replace("'","") -o "${_dump_path}${b}.${format}" -c > csv_runtime.log };
            } else {
                Get-Content "${_target_path}" | ForEach-Object { $b=[System.IO.Path]::GetFileName($_.Replace("'","")); pe-compass inspect -f $_.Replace("'","") -o "${_dump_path}${b}.${format}" > json_runtime.log };
            }
        }
    }
};

launch;
