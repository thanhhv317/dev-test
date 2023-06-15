const { connection } = require("../../infrastructure/orm/mysql/mysql");
const StudentScoreEntity = require("../entities/student-score.entity");

module.exports = {
  getScore: async (req, res) => {
    try {
      const { id } = req.params;

      if (!id) {
        throw new Error("id is not valid");
      }
      let scores = [];
      await connection.query(
        "SELECT t.id as id, students.id as student_id, students.name,t.score as score, t.coefficient as coefficient, t.type as type, s.name as subject_name FROM students JOIN transcript t on students.id = t.student_id JOIN subjects s on t.subject_id = s.id WHERE students.id =  ?",
        [Number(id)],
        (err, results) => {
          if (err) {
            throw err;
          }
          scores = results.map((score) => {
            return new StudentScoreEntity(score);
          });
        }
      );

      return res.status(200).json({
        scores,
        count: length(scores),
      });
    } catch (error) {
      return res.status(500).json({
        message: "500 internal server error.",
        detail: error,
      });
    }
  },

  updatePost: async (req, res) => {
    try {
      const { id } = req.params;
      const { transcipt_id, score, coefficient, type } = req.body;

      if (score > 10 || score < 0) {
        throw new Error("Score is not valid");
      }

      if (!id) {
        throw new Error("id is not valid");
      }

      const studentScore = await connection.query(
        "select * from transcript where id = ? and student_id = ?",
        [Number(transcipt_id), Number(id)],
        (error, result) => {
          if (err) {
            throw err;
          }
          if (!result) {
            throw new Error("record not found");
          }
        }
      );

      connection.query(
        "UPDATE transcript SET score = ?, type = ?, coefficient= ? WHERE id = ? and student_id = ? ",
        [
          Number(score),
          Number(type),
          Number(coefficient),
          Number(transcipt_id),
          Number(id),
        ],
        (err, results) => {
          if (err) {
            throw err;
          }
        }
      );

      return res.status(200).json({
        message: "OK",
      });
    } catch (error) {
      return res.status(500).json({
        message: "500 internal server error.",
        detail: error,
      });
    }
  },
};
