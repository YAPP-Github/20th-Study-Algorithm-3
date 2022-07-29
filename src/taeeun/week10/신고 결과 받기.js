function solution(id_list, report, k) {
    const usersCnt = id_list.length;
    const answer = new Array(usersCnt).fill(0);
    const reportArray = Array.from(Array(usersCnt), ()=>new Array())

    for (let i=0; i<report.length; i++) {
        const user = report[i].split(" ")[0];
        const reported = report[i].split(" ")[1];
        
        //console.log(id_list.indexOf(user));
        const idx = id_list.indexOf(reported);
        if (reportArray[idx].findIndex((e)=>e===user)==-1) {
            reportArray[idx].push(user);
        }
    }
    

    for (let i=0; i<reportArray.length; i++) {
        if (reportArray[i].length<k) continue;
        for (const user of reportArray[i]) {
            const idx = id_list.indexOf(user);
            answer[idx]++;
        }
    }
     
    return answer;
}
