s=/Users/bob/blog/babyking.github.io/_drafts/go-yu-yan-xue-xi-yu-dao-de-wen-ti-xiao-ji.md

date_str=`date '+%Y-%m-%d %H:%M'`
file_prefix=$(echo $date_str | cut -d " " -f 1)
date_line="date: $date_str"

echo $date_str
echo $file_prefix
echo $date_line

line_number=$(grep -n  "date: "  $s | head -n 1 | cut -d ":" -f 1)

echo $line_number

sed -i  '' "$(echo $line_number)s/^.*$/date: $(echo $date_str)/" $(echo $s)

d=$blog_path/_posts/$file_prefix-`basename $s`

echo $d