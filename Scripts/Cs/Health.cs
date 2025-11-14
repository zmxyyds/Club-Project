using Godot;
using System;
using System.ComponentModel.DataAnnotations;

/// <summary>
/// 伤害类型
/// </summary>
public enum DamageType
{   
	/// <summary>
	/// 物理伤害
	/// </summary>
	Physical,
	/// <summary>
	/// 其他伤害
	/// </summary>
	/// <remarks>
	/// 一些无法解析的伤害，一般是错误拼写导致的<para/>
	/// 所以正常情况下故意对目标造成Other伤害是不允许的。<para/>
	/// 默认情况下，目标对Other伤害的防御力是100%
	/// </remarks>
	Other
}

/// <summary>
/// 最大生命值的设置模式,用于<see cref="Health.SetMaxHealth(float, SetMaxHealthMode, SetCurrentHealthMode)"/>方法
/// </summary>
public enum SetMaxHealthMode:byte
{
	/// <summary>
	/// 直接设置最大生命值
	/// </summary>
	Set = 0,
	/// <summary>
	/// 增加（或减少）最大生命值
	/// </summary>
	Add = 1,
	/// <summary>
	/// 按照缩放比例来设置最大生命值
	/// </summary>
	Proportion = 2,
}

/// <summary>
/// 当前生命值的设置模式,用于<see cref="Health.SetMaxHealth(float, SetMaxHealthMode, SetCurrentHealthMode)"/>方法
/// </summary>
public enum SetCurrentHealthMode:byte
{
	/// <summary>
	/// 按照缩放比例来设置当前生命值
	/// </summary>
	Proportion = 0,
	/// <summary>
	/// 不进行任何操作，但会检查当前生命值是否超过最大生命值
	/// </summary>
	NoAction = 1,
	/// <summary>
	/// 同步设置当前生命值，你加多少我也加多少
	/// </summary>
	Sync = 2,
}

public partial class Health : Node
{
	[ExportGroup("生命值")]
	/// <summary>
	/// 最大的生命值	
	/// </summary>
	[Export] private float maxHealth = 100;//最大生命值
	/// <summary>
	/// 最大的生命值
	/// </summary>
	/// <remarks>
	/// 在这里set maxHealth很不安全<para/>
	/// 你可以通过<see cref="SetMaxHealth(float, bool)"/>方法来修改maxHealth,
	/// 并选择是否要按照比例来修改currentHealth
	/// </remarks>
	/// <value><see cref="maxHealth"/></value>
	public float MaxHealth { get { return maxHealth; } set { maxHealth = value; } }
	[Export] private float currentHealth;//当前生命值
	/// <summary>
	/// 当前的生命值
	/// </summary>
	/// <value><see cref="currentHealth"/></value>
	public float CurrentHealth { get { return currentHealth; } set { currentHealth = value; } }


	
	public void SetMaxHealth(float value, SetMaxHealthMode mode = SetMaxHealthMode.Set, SetCurrentHealthMode currentHealthMode = SetCurrentHealthMode.Proportion)
	{
		float temp = maxHealth;
		switch (mode)
		{
			case SetMaxHealthMode.Set:
				maxHealth = value;
				break;
			case SetMaxHealthMode.Add:
				maxHealth += value;
				break;
			case SetMaxHealthMode.Proportion:
				maxHealth *= value;
				break;
		}


		switch (currentHealthMode)
		{
			case SetCurrentHealthMode.Proportion:
				currentHealth = currentHealth / temp * maxHealth;
				break;

			case SetCurrentHealthMode.Sync:
				currentHealth += maxHealth - temp;
				break;
			case SetCurrentHealthMode.NoAction:
				currentHealth = Math.Min(currentHealth, maxHealth);
				break;
		}
		GD.Print($"最大生命值被更改ヾ≧▽≦*)o，MaxHealth: {maxHealth}, currentHealth: {currentHealth}");
	}
	
	
	/// <summary>
	/// 伤害
	/// </summary>
	/// <param name="amount">伤害量</param>
	/// <param name="damageType">伤害类型</param>
	private void Damage(float amount, DamageType damageType)
	{
		
	}

	public override void _Ready()
	{
		currentHealth = maxHealth;
		GD.Print($"新的Health组件被创建，MaxHealth: {maxHealth}, currentHealth: {currentHealth}");
	}
}
