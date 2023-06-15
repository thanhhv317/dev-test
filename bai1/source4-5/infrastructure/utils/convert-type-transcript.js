const typeTranscript = new Map([
  [0, "Điểm kiểm tra miệng"],
  [1, "Điểm kiểm tra 15 phút"],
  [2, "Điểm kiểm tra 1 tiết"],
  [3, "Điểm học kỳ"],
]);

const convertTranscriptType = (type) => {
  return typeTranscript[type] || "";
};

module.exports = convertTranscriptType;
