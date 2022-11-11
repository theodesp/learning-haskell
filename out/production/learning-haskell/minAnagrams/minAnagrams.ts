function anagramCheck(word1: string, word2: string): number {
  let result = 0;
  const count1 = wordFrequency(word1);
  const count2 = wordFrequency(word2);
  for (let c in count1) {
    if (count2.hasOwnProperty(c)) {
      result += Math.abs(count1[c] - count2[c]);
    } else {
      result += 1;
    }
  }

  for (let c in count2) {
    if (count1.hasOwnProperty(c)) {
      result += Math.abs(count1[c] - count2[c]);
    } else {
      result += 1;
    }
  }

  return result;
}

function wordFrequency(word: string) {
  const freq = {};
  for (let i = 0; i < word.length; i++) {
    let c = word[i];
    if (freq.hasOwnProperty(c)) {
      freq[c]++;
    } else {
      freq[c] = 1;
    }
  }

  return freq;
}
