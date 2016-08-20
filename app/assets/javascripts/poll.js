var choiceRegex = /choices_(\d+)\[\]\[value\]/

$(document).on('turbolinks:load', function(){
  $("input[data-question='1']").blur(function(event){
    var inputQuestion = $(event.target);

    if(inputQuestion.val() !== ''){
      var currentQuestionIndex = parseInt(inputQuestion.attr("data-question"));
      var nextQuestionIndex = currentQuestionIndex + 1;

      var newQuestion = inputQuestion.parent().clone(true);
      var currentInputTag = 'input[data-question="'+ currentQuestionIndex + '"]';
      newQuestion.children(currentInputTag).val("");
      newQuestion.children(currentInputTag).attr("data-question", nextQuestionIndex);
      newQuestion.children('label').text("Poll Question " + nextQuestionIndex);

      var choiceList = newQuestion.children('ul');

      var firstChoice = choiceList.children().first().children('input');
      firstChoice.attr("name", "choices_" + nextQuestionIndex + "[][value]");
      firstChoice.attr("data-choice-"+nextQuestionIndex, 1);
      firstChoice.removeAttr('data-choice-'+currentQuestionIndex);

      for(var i = choiceList.length-1; i > 0; i--){
        choiceList[i].remove();
      }

      inputQuestion.parent().parent().append(newQuestion);
    }
  });

  $("input[data-choice-1='1']").blur(function(event) {
    var inputChoice = $(event.target);

    if(inputChoice.val() !== ''){
      var currentQuestion = parseInt(choiceRegex.exec(inputChoice.attr('name'))[1]);
      var currentChoiceDataAttribute = "data-choice-"+currentQuestion;
      var nextChoice = parseInt(inputChoice.attr(currentChoiceDataAttribute)) + 1;

      var newChoice = inputChoice.parent().clone(true);
      var newInput = newChoice.children('input');
      newInput.val('');
      newInput.attr(currentChoiceDataAttribute, nextChoice);
      newInput.attr('placeholder', 'Answer '+ nextChoice);

      inputChoice.parent().parent().append(newChoice);
    }
  });
});
