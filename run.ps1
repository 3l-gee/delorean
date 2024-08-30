# Start the Java application
$process = Start-Process -FilePath "java" -ArgumentList "-jar target\delorean-1.0.0.jar" -NoNewWindow -PassThru -RedirectStandardInput -RedirectStandardOutput

# Wait for the application to be ready for the next command
function WaitForPrompt {
    param (
        [string]$prompt = '>'
    )
    while ($true) {
        $output = $process.StandardOutput.ReadLine()
        if ($output -like "*$prompt*") {
            break
        }
        Write-Host $output
    }
}

# Send commands and wait for the application to process each one
$process.StandardInput.WriteLine("new a5_1_1")
WaitForPrompt

$process.StandardInput.WriteLine("xml_config - a5_1_1")
WaitForPrompt

$process.StandardInput.WriteLine("db_config - a5_1_1")
WaitForPrompt

$process.StandardInput.WriteLine("xml - load C:\Users\rapha\Documents\project\delorean\src\main\resources\a5_1_1\a5_1_1_dataset.xml")
WaitForPrompt

$process.StandardInput.WriteLine("db - startup")
WaitForPrompt

$process.StandardInput.WriteLine("db - load")
WaitForPrompt

$process.StandardInput.WriteLine("exit")

# Wait for the process to exit
$process.WaitForExit()
